class ChatController < BaseAuthController

  def index
    @messages = Message.all
  end

  def message
    message = Message.create(body: params.require(:body))
    message.user = @current_user
    message.save

    return render status: :bad_request unless message.valid?

    respond_to do |format|
      format.html redirect_to chat_path
      format.json { render json: {
          body: message.body,
          avatar_url: message.user.avatar_url,
          created_at: message.created_at
      } }
    end
  end


end