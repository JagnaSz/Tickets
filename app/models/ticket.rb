class Ticket < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: {minimum: 6}, presence: true
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :price, presence: true
  validates :seat_id_seq, length: {minimum: 2, maximum: 4}, presence: true
  validates :phone, length: { is: 9 }, presence: true
end

