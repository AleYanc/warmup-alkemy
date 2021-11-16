class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
end