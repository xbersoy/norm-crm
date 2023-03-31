source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem 'rails', '~> 7.0.2', '>= 7.0.2.3'
gem 'sprockets-rails'
gem 'puma', '~> 5.6'
gem 'importmap-rails'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'bootsnap', require: false
gem 'stimulus-rails'
gem 'jbuilder'
gem 'pg'
gem 'devise'
gem 'devise-two-factor'
gem 'sassc-rails'
gem "turbo-rails"
gem "redis", "~> 4.0"
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"
# gem "image_processing", "~> 1.2"

# Custom
gem 'bootstrap', '~> 5.1'
gem 'inline_svg', '~> 1.7'
gem 'kramdown', '~> 2.3'
gem 'kramdown-parser-gfm', '~> 1.1'
gem 'rails-i18n', '~> 7.0'
gem 'rouge', '~> 3.26'
gem 'simple_form', '~> 5.1'
gem 'rqrcode', '~> 2.1'
gem 'view_component'

group :development, :test do
  gem 'debug', platforms: %i[mri mingw x64_mingw]
  gem 'guard-rspec', require: false
  gem 'rubocop-rspec'
  gem 'rubocop-rspec-focused', '0.1.0'
  gem 'rubocop-performance', require: false
  gem 'guard-rubocop'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'rubocop'
end

group :development do
  gem 'web-console'
  # gem "rack-mini-profiler"
  # gem "spring"
end

group :test do
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

group :test, :development do
  gem 'diffy'
  gem 'equivalent-xml'
end

group :production do
  # gem 'pg'
end
