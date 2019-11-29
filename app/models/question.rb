class Question < Post
  validates :title, presence: true
  has_many :answers
  has_rich_text :body
  accepts_nested_attributes_for :answers

  def answered?
    answers.size > 0
  end

  def top_answer
    answers.last
  end
end