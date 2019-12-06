class Subscription < ApplicationRecord
  validates :chat_name, presence: true, uniqueness: true

end