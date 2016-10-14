require 'telegram/bot'
require './lib/telegram_bot_configurator'

config = TelegramBotConfigurator.new
config.configure

token = config.get_token
logger = config.get_logger

logger.debug 'Starting telegram bot'

URL_PREFIX = if Rails.env.production?
               'http://cosmit.me/'
             else
              #  'localhost:3000'
               'http://cosmit.me/'
             end

Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when '/sobre'
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Bem-vindo a COSMIT http://cosmit.me")
    when '/artigo'
      post = Post.order('RANDOM()').first
      bot.api.send_message(chat_id: message.chat.id,
                           text: post.title+"\n"+URL_PREFIX+post.slug,
                           disable_web_page_preview: false)\
    else
      bot.api.send_message(chat_id: message.chat.id,
                           text: "Não entendi o que você disse #{message.from.first_name}!")
    end
  end
end
