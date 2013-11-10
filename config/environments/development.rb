WeAreMany::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports and disable caching.
  config.consider_all_requests_local       = true
  config.action_controller.perform_caching = false

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.precompile = true
  config.assets.debug = false
  config.assets.logger = false

  config.assets.compress = false

  # omniauth-provider
  # Social Network-Providers
  config.oauth_provider = {
    xing: {
      key: '6a72b7a5fa3bbdf9864c',
      secret: 'e8d8427a9340643c34dfed9a0ae34fb3c5a52328',
      site: "https://api.xing.com",
      request_token_path: "/v1/request_token",
      authorize_path: "/v1/authorize",
      access_token_path: "/v1/access_token",
      use_api: true
    }
  }
end
