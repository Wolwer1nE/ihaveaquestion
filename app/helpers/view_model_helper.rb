module ViewModelHelper
  def view_model(model)
    if [Question, Answer].include? model.class
      post_view_model(model)
    elsif model.is_a?(User)
      user_view_model(model)
    else
      {}
    end
  end

  def post_view_model(question)
    {
        title: question.title,
     body: question.body,
     user: user_view_model(question.user)

    }
  end

  def user_view_model(user)
    {
        name: user.login
    }
  end
end