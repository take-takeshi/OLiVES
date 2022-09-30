require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OLiVES
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    I18n.available_locales = %i(ja en)
    I18n.enforce_available_locales = true

    # デフォルトのlocaleを日本語(:ja)にする
    I18n.default_locale = :ja
    config.time_zone = "Asia/Tokyo"
    
    #複数のロケールが読み込まれるようパスを通す
    #https://qiita.com/shimadama/items/7e5c3d75c9a9f51abdd5
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]
    
    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
