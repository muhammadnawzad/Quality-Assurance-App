class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be a valid email address" }
  validates :password_digest, presence: true
  has_secure_password
  validates :role_id, presence: true
  belongs_to :role
  has_many :questions
  has_many :answers

  def has_role?(role_name)
    role.name == role_name
  end

end
