# frozen_string_literal: true

require 'net/http'
require 'misc/slack_notification'

class ExchangeRateDownloader
  def initialize(notify_via = 'console')
    @notify_via  = notify_via
    @retry_count = 5
  end

  def update_today
    download_and_parse('today.xml')
  end

  def update_date(date)
    # url example for jan 2, 2014 => http://www.tcmb.gov.tr/kurlar/201401/02012014.xml
    folder = date.strftime('%Y%m')
    page = date.strftime('%d%m%Y')
    download_and_parse("#{folder}/#{page}.xml")
  end

  private

  def download_and_parse(path)
    connection = Faraday.new 'https://www.tcmb.gov.tr' do |conn|
      conn.response :xml, content_type: /\bxml$/ # converts the response to hash
      conn.use FaradayMiddleware::FollowRedirects, limit: 20
      conn.adapter Faraday.default_adapter
    end

    response = connection.get "/kurlar/#{path}"

    if response.status == 200
      parse_and_save(response.body)
    elsif response.status == 404 && @retry_count.positive?
      notify "Exchange rate download from '#{path}' failed, trying again."

      sleep 1
      @retry_count -= 1

      download_and_parse(path)
    else
      notify "Could not download exchange rates from '#{path}', response status code: '#{response.status}'."
    end
  end

  def parse_and_save(body)
    date = Date.strptime(body['Tarih_Date']['Date'], '%m/%d/%Y')
    currencies = body['Tarih_Date']['Currency']

    Shards.write_to_each_shard { save_currencies(date, currencies) }

    notify "Found and saved exchange rates for #{date}"
  end

  def save_currencies(date, currencies)
    currencies.each do |currency|
      currency_code = currency['Kod']

      next unless currency['ForexBuying'] && currency['ForexSelling']
      next unless ALLOWED_CURRENCIES.include?(currency_code)

      unit = parse_big_decimal(currency['Unit'])
      exchange_rate = ExchangeRate.where(date: date, currency: currency_code).first_or_initialize
      exchange_rate.buying_rate = parse_big_decimal(currency['ForexBuying']) / unit
      exchange_rate.selling_rate = parse_big_decimal(currency['ForexSelling']) / unit

      notify "Could not save exchange rate on #{date} for #{currency_code}" unless exchange_rate.save
    end
  end

  def parse_big_decimal(value)
    return BigDecimal('0') if value.blank?

    BigDecimal(value)
  end

  def notify(text)
    if @notify_via == 'slack'
      SlackNotification.send_notification text
    else
      puts text
    end
  end
end
