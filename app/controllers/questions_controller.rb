class QuestionsController <  BaseAuthController

def index
    @questions = Question.all.order(:created_at).reverse
  end

  def show
    @question = Question.find_by_id(params[:id])
  end

  def new
  end

  def create
    question_params = params[:question]
    question = Question.new(title: question_params[:title], body: question_params[:body])
    question.user = @current_user
    question.save
    if question.valid?
      NotifySubscribersJob.perform_later "New question: #{question.title}"
      redirect_to question
    else
      flash[:alert] = 'Не удалось создать вопрос.'
      redirect_to new_question_path
    end
  end


end
