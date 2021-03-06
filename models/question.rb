class Question < ApplicationRecord
  validates :title, presence: true, length: {minimum: 5}
  validates :description, presence: true, length: {minimum: 10}
  has_many :answers
end
