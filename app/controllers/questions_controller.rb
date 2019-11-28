class QuestionsController < ApplicationController
  before_action :get_user


  def index
    @questions = Question.all.order(:created_at)
  end

  def show

  end

  def new

  end

  def create
    redirect_to :index
  end

  private

  def get_user
    @current_user = User.find_by_id(session[:user])
    redirect_to auth_path unless @current_user.present?
  end
end
