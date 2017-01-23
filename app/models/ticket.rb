class Ticket < ActiveRecord::Base
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :name, length: {minimum: 6}, presence: true
  validates :email_address, presence: true, format: { with: VALID_EMAIL_REGEX }
  validates :price, presence: true
  validates :seat_id_seq, length: {minimum: 2, maximum: 4}, presence: true
  validates :phone, length: { is: 9 }, presence: true
  validates :age, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }, presence: true
  validates :tickets_number, :numericality => { :greater_than => 0, :less_than_or_equal_to => 6 }

  belongs_to :event
  belongs_to :user

  SEATS = ['A12','A13', 'A14' , 'B12', 'B13' ,'B14', 'C12','C13' , 'C14' , 'D12' , 'D13'  ,  'D14' ]
  NOT_TAKEN_SEATS = ['A12','A13', 'A14' , 'B12', 'B13' ,'B14', 'C12','C13' , 'C14' , 'D12' , 'D13'  ,  'D14' ]
end

