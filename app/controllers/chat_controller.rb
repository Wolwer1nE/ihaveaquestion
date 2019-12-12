class ChatController < BaseAuthController

  def index
    @messages = Message.all
  end

  def message
    message = Message.create(body: params.require(:body))
    message.user = @current_user
    message.save
    return render status: :bad_request unless message.valid?

    redirect_to chat_path
  end


end