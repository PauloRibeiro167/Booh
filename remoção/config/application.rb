require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GeniusDi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_paths += %W(#{config.root}/lib)

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end

# Configuração para Tailwind CSS
Rails.application.config.to_prepare do
  Rails.application.config.assets.precompile += %w(
    tailwind.css
    # Adicione outros arquivos de assets aqui se necessário
  )

  # Adicionando tarefa Rake para compilar Tailwind CSS
  Rails.application.load_tasks
  Rake::Task.define_task("tailwindcss:compile") do
    system("rails tailwindcss:build")
  end
end
