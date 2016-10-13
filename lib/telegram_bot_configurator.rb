require 'logger'

require './lib/telegram_bot_database'

class TelegramBotConfigurator
  def configure
    setup_i18n
    setup_database
  end

  def get_token
    YAML::load(IO.read('config/secrets.yml'))['telegram_token']
  end

  def get_logger
    Logger.new(STDOUT, Logger::DEBUG)
  end

  private

  def setup_i18n
    I18n.locale = :'pt-BR'
    I18n.backend.load_translations
  end

  def setup_database
    TelegramBotDatabase.establish_connection
  end
end
