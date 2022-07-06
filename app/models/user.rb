class User < ApplicationRecord
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be a valid email address" }
  validates :password_digest, presence: true
  has_secure_password
  has_many :role
end
