class User < ApplicationRecord
  validates :login, presence: true, uniqueness: true
  has_many :questions
  has_many :answers
end