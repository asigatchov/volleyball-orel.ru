require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    #config.time_zone = '+4000'
    #config.active_record.default_timezone = 'Moscow'
    #I18n.default_locale = :ru
    config.i18n.default_locale = :ru
  end
end
