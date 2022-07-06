class Answer < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :user_id, presence: true
  validates :question_id, presence: true
  validates :content, presence: true
  belongs_to :user
  belongs_to :question

  def choose_the_best
    self.question.answers.update_all(is_chosen_as_best_answer: false)
    self.is_chosen_as_best_answer = true
  end

end
