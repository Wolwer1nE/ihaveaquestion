class Answer < Post
  belongs_to :question
  has_rich_text :body

end