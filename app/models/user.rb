class User < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  before_save { email.downcase! }

  validates :name,  presence: true, length: { maximum: 50 }
  validates :last_name,  presence: true, length: { maximum: 50 }
  validates :email, presence: true,  length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX },  uniqueness: true
  validates :age, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }, presence: true

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  has_many :tickets
end
