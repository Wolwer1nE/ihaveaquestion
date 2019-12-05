require 'singleton'
require 'telegram/bot'
class TelegramService
  include Singleton

  def initialize
    @token = ENV['TELEGRAM_TOKEN']
  end

  def new_subscribe(id)
    text = if Subscribtion.find_by_chat_name(id).present?
             'Already Subscribed'
           else
             Subscribtion.create(chat_name: id).valid? ? 'Subscribed!' : 'Can\'t Subscribed!'
           end
    @bot.api.send_message(chat_id: message.chat.id, text: text)
  end


  def unsubscribe(id)
    subscribe = Subscribtion.find_by_chat_name(id)
    subscribe.destroy if subscribe.present?
    @bot.api.send_message(chat_id: message.chat.id, text: 'Unsubscribed!')
  end

  def start
    Telegram::Bot::Client.run(@token) do |bot|
      @bot = bot
      bot.listen do |message|
        case message.text
        when '/subscribe'
          new_subscribe(message.chat.id)
        when '/unsubscribe'
          unsubscribe(message.chat.id)
        end
      end
    end
  rescue StandardError => e
    Rails.logger.info e.message
  end

  def send_message(message, chat_id)
    @bot.api.send_message(chat_id: chat_id, text: message)
  end

end
