require 'misc/exchange_rate_downloader'

namespace :norm do
  desc "update exchange rates using today.xml"
  task :exc_rate_today => :environment do |t, args|
    downloader = ExchangeRateDownloader.new
    downloader.update_today
    # call update service
  end

  desc "update exchange rates for the given date. (date format: yyyy-mm-dd)"
  task :exc_rate_date, [:date] => :environment do |t, args|
    date = Date.new
    begin
      date = Date.strptime(args.date, '%Y-%m-%d')
    rescue StandardError
      puts 'Invalid date. Expected format is yyyy-mm-dd'
    end
    downloader = ExchangeRateDownloader.new
    downloader.update_date(date)
    # call update service
  end

  desc "update exchange rates beginning from the given date until today. (date format: yyyy-mm-dd)"
  task :exc_rate_batch, [:date] => :environment do |t, args|
    date = Date.new
    begin
      date = Date.strptime(args.date, '%Y-%m-%d')
    rescue StandardError
      puts 'Invalid date. Expected format is yyyy-mm-dd'
    end
    downloader = ExchangeRateDownloader.new
    while date <= Date.today do
      downloader.update_date(date)
      date = date + 1.day
    end
    # call update service
  end
end
