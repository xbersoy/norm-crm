# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

SUBDOMAIN_PREFIX = ENV['SUBDOMAIN_PREFIX'].present? ? ".#{ENV['SUBDOMAIN_PREFIX']}" : nil
NORM_APP_SUBDOMAIN = "app#{SUBDOMAIN_PREFIX}".freeze
NORM_ADMIN_SUBDOMAIN = "admin#{SUBDOMAIN_PREFIX}".freeze
NORM_API_SUBDOMAIN = "api#{SUBDOMAIN_PREFIX}".freeze

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module NormCrm
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Use rack sanitizer middleware
    # config.middleware.insert 0, Rack::UTF8Sanitizer

    # Rack middleware for blocking & throttling
    # config.middleware.use Rack::Attack

    # Use Cloudflare middleware to get the correct client IPs
    # require Rails.root.join('config', 'middleware', 'rack', 'cloudflare').to_s
    # config.middleware.insert_before 0, Rack::Cloudflare

    # Using it to avoid errors because of invalid jsons
    # require Rails.root.join('config', 'middleware', 'catch_json_parse_errors').to_s
    # config.middleware.use CatchJsonParseErrors

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras

    config.credentials.content_path = 'config/credentials.yml.enc'
  end
end
