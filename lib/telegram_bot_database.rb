require 'active_record'
require 'logger'

class TelegramBotDatabase
  class << self
    def establish_connection
      ActiveRecord::Base.logger = Logger.new(active_record_logger_path)

      if Rails.env.production?
        configuration = YAML::load(IO.read(database_config_path)).merge(adapter: 'postgresql')
      else
        configuration = ENV["DATABASE_URL"]
      end

      ActiveRecord::Base.establish_connection(configuration)
    end

    private

    def active_record_logger_path
      'debug.log'
    end

    def database_config_path
      'config/database.yml'
    end
  end
end
