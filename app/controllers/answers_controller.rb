class AnswersController < ApplicationController
  before_action :get_user

  def create
    answer_params = params[:answer]
    question = Question.find_by_id(params[:question_id])
    question.answers.create(title: answer_params[:title],
                            body: answer_params[:body],
                            user: @current_user)
    redirect_to question
  end

  private

  def get_user
    @current_user = User.find_by_id(session[:user])
    redirect_to auth_path unless @current_user.present?
  end
end
