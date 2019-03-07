require_relative 'boot'

require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"

Bundler.require(*Rails.groups)

module Skynet
  class Application < Rails::Application
    config.load_defaults 5.2

    config.i18n.available_locales = [:'pt-BR']
    config.i18n.default_locale = :'pt-BR'
    config.time_zone = 'Brasilia'
    config.encoding = 'utf-8'

    config.generators do |g|
      g.test_framework false
      g.helper false
      g.stylesheets false
      g.javascripts false
      g.view_specs false
      g.orm :active_record, primary_key_type: :uuid
    end

  end
end
