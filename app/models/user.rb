class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :surname, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250}, format:  {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :age, presence: true, length: {maximum: 3}
  validates :password, presence: true, length: {minimum: 6, maximum: 50}

  has_secure_password
end
