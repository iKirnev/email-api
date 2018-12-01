require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EmailApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.before_configuration do
      env_file = Rails.root.join("config", 'environment_variables.yml').to_s

      puts '============= RAILS ENV VARIABLES from config/environment_variables.yml =============='
      if File.exists?(env_file)
        YAML.load_file(env_file)[Rails.env].each do |key, value|
          ENV[key.to_s] = value
          puts "#{key.to_s} : #{ENV[key.to_s]}#{"<== VALUE SHOULD NOT BE EMPTY!!!" if ENV[key.to_s].blank?}"
        end
      else
        puts 'environment_variables YAML not found'
      end
    end
  end
end
