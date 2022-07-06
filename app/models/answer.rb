class Answer < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :question
end
