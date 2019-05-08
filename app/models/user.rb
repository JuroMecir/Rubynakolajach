class User < ApplicationRecord

  has_many :catches, dependent: :destroy

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: {maximum: 50}
  validates :surname, presence: true, length: {maximum: 50}
  validates :email, presence: true, length: {maximum: 250}, format:  {with: VALID_EMAIL_REGEX}, uniqueness: { case_sensitive: false }
  validates :age, presence: true, length: {maximum: 3}
  validates_numericality_of :age
  validates :password, presence: true, length: {minimum: 6, maximum: 50}


  def feed
    Catch.where("user_id = ?", id)
  end

  has_secure_password
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
               BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def self.search(search)
    if search
      where(["name LIKE ? ","%#{search}%"]).or(where(["surname LIKE ? ","%#{search}%"]))
    else
      all
    end

  end

end
