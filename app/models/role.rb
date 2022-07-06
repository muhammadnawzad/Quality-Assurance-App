class Role < ApplicationRecord
  validates :user_id, uniqueness: true
  validates :user_id, presence: true
  validates :name, presence: true
  belongs_to :user
end
