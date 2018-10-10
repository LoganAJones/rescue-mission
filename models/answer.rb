class Answer < ActiveRecord::Base
  validates :description, presence: true, length: {minimum: 5}
  belongs_to :question

end
