require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TeacherSite
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.time_zone = 'Moscow'
    config.active_record.default_timezone = :utc
    config.i18n.available_locales = [:ru, :en]
    config.i18n.default_locale = :ru
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    #
    # config.autoload_paths += %W(#{Rails.root}/lib)
    # config.eager_load_paths << "#{Rails.root}/lib"
    # config.assets.initialize_on_precompile = false
    config.autoload_paths += %W(#{config.root}/app/models/ckeditor)
    # config.assets.precompile += Ckeditor.assets
    # config.assets.precompile += %w(ckeditor/*)

    config.react.addons = true
  end
end
