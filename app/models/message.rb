class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :user

  def direction(user)
    self.user == user ? 'outgoing' : 'incoming'
  end
end
