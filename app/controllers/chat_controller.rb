class ChatController < BaseAuthController

  def index
    @messages = Message.all
  end

  def message
    message = Message.create(body: params.require(:body))
    message.user = @current_user
    message.save

    return render status: :bad_request, json: {} unless message.valid?
    ActionCable.server.broadcast('chat_channel',
                                 body: message.body,
                                 user_id: message.user.id,
                                 avatar_url: message.user.avatar_url,
                                 created_at: (l message.created_at))
    render status: :ok, json: {}
  end


end