class QuestionsController < ApplicationController

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
end
