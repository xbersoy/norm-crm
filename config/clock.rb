require './config/boot'
require './config/environment'
require './lib/misc/exchange_rate_downloader'
require 'rake'

include Clockwork

every(1.day, 'update_exchange_rates', at: '18:00', tz: 'Istanbul', if: ->(_) { !Date.today.saturday? && !Date.today.sunday? }) do
  downloader = ExchangeRateDownloader.new('slack')
  downloader.update_today
end
