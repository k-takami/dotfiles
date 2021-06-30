require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MockupNas613
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults Rails::VERSION::STRING[..-3].to_f
    config.time_zone = 'Asia/Tokyo'
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
    # config.eager_load_paths << Rails.root.join("extras")

    config.middleware.use Rack::Attack

    config.generators do |g|
      g.jbuilder    false
      g.channel assets: false
      g.helper      false  # <--- 自家製generator  < Rails::Generators::NamedBase をつくる人もいる
      g.stylesheets false
      g.javascripts false

      g.test_framework :rspec
      g.factory_bot true
      g.fixture_replacement :factory_bot
      g.model_specs true
      g.controller_specs true
      g.decorator_specs false
      g.view_specs false
      g.helper_specs false
      g.request_specs false
      g.routing_specs false
      # gem 'name', "1.0", :require => "", :group => :test.orm :active_record, primary_key_type: :uuid
    end
  end
end

Settings = EasySettings
