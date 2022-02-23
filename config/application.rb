require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)

module Langamer
  class Application < Rails::Application
    config.load_defaults 6.0
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]
    config.active_model.i18n_customize_full_message = true # 追記
    config.generators do |g|
      g.test_framework :rspec,
                        model_specs: true,
                        view_specs: false,
                        helper_specs: false,
                        routing_specs: false,
                        controller_specs: false,
                        request_specs: false
                        g.fixture_replacement :factory_bot, dir: "spec/factories"
    end
  end
end
