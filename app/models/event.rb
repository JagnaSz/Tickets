# require 'validators/future_validator.rb'

class Event < ActiveRecord::Base


  validates :artist, presence: true
  validates :description, length: {maximum: 200}, presence: true
  validates :price_low, presence: true
  validates :price_high, presence: true
  validates :event_date, future: true, presence: true




  has_many :tickets

end