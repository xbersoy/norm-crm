# frozen_string_literal: true

require 'active_support/core_ext/integer/time'

NORM_APP_HOST = ENV['NORM_APP_HOST'] || 'uygulama.norm.localhost:3030'
URL_PROTOCOL = ENV['URL_PROTOCOL'] || 'http'
NORM_APP_URL = "#{URL_PROTOCOL}://#{NORM_APP_HOST}".freeze

Rails.application.routes.default_url_options[:host] = NORM_APP_HOST
Rails.application.routes.default_url_options[:protocol] = URL_PROTOCOL

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.
  config.hosts << NORM_APP_HOST # Whitelist one hostname
  config.hosts << /uygulama\.norm\.localhost\Z/ # Whitelist a test domain
  config.hosts << "www.example.com"
  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable server timing
  config.server_timing = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  # ASSET MNG START ===========

  # Suppress logger output for asset requests.
  # config.assets.quiet = true

  # FIX: not sure with this line
  # config.assets.debug = true

  # a comment by me
  # config.sass.inline_source_maps = true

  # added this line for reloading assets on navigation
  # before adding the line below when you press back button from signin page app doesnt navigate back
  # or when you navigate to sign in page from sign in page css's not loading (only common css classes like .home, .root)
  # ie: login screen background color is different but it wasn't changing
  # config.assets.digest = false

  # ASSET MNG END ===========


  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true

  config.action_mailer.default_url_options = { host: 'localhost', port: 3030 }
  config.active_record.encryption.primary_key = 'test'
  config.active_record.encryption.deterministic_key = 'test'
  config.active_record.encryption.key_derivation_salt = 'test'
  ENV['OTP_SECRET_KEY'] = 't0ps3cr3tt0ps3cr3tt0ps3cr3t' * 3
end
