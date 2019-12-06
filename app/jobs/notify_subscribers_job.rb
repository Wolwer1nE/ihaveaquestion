class NotifySubscribersJob < ApplicationJob
  queue_as :default

  def perform(*args)
    text = args[0]
    Subscription.all do |subscriber|
      Rails.logger.info "Found subscriber! #{subscriber.chat_name}"
      TelegramService.instance.send_message(text, subscriber.chat_name)
    end
  end
end
