require File.expand_path('../boot', __FILE__)

# Pick the frameworks you want:
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

if defined?(Bundler)
  # If you precompile assets before deploying to production, use this line
  Bundler.require(*Rails.groups(:assets => %w(development test)))
  # If you want your assets lazily compiled in production, use this line
  # Bundler.require(:default, :assets, Rails.env)
end

module WeAreMany
  class Application < Rails::Application

    # Enable the asset pipeline
    config.assets.enabled = true
    config.app_generators.stylesheet_engine :less
    config.assets.paths << Rails.root.join("app", "assets", "fonts").to_s
    #config.assets.paths << Rails.root.join("vendor", "assets").to_s

    config.time_zone = 'Berlin'
    ActiveRecord::Base.default_timezone = 'Berlin'

    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :de

    # Configure the default encoding used in templates for Ruby 1.9.
    config.encoding = "utf-8"


  end
end
