require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Blog
  class Application < Rails::Application
<<<<<<< HEAD
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1
=======
    # Initialize configuration defaults for originally generated Rails version.
    config.assets.paths << Rails.root.join("app", "assets", "fonts")
    config.load_defaults 7.2
>>>>>>> 734aed9 (Actualizacion final)

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
<<<<<<< HEAD
    config.autoload_lib(ignore: %w(assets tasks))
=======
    config.autoload_lib(ignore: %w[assets tasks])
>>>>>>> 734aed9 (Actualizacion final)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
