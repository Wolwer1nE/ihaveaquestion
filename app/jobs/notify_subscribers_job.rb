class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    text = args[0]
    Subscribtion.all do |subscribe|
      TelegramService.instance.send_message(text, subscribe.chat_name)
    end
  end
end
