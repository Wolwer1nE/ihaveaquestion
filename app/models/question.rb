class Question < Post
  validates :title, presence: true
  has_many :answers

  def answered?
    answers.size > 0
  end

  def top_answer
    answers.last
  end
end