require 'singleton'
require 'telegram/bot'
class TelegramService
  include Singleton

  def initialize
    @token = ENV['TELEGRAM_TOKEN']
  end

  def start
    Telegram::Bot::Client.run(@token) do |bot|
      bot.listen do |message|
        case message.text
        when '/start'
          bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name}")
        when '/stop'
          bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
        end
      end
    end
  rescue StandardError => e
    Rails.logger.info e.message
  end

  def send_message(message, chat_id)

  end

end
