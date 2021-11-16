class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :password, presence: true
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum:105}, uniqueness: {case_Sensitive: false}, format: { with: VALID_EMAIL_REGEX }
  
end
