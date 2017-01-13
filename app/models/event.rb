class Event < ActiveRecord::Base

  validates :artist, presence: true
  validates :description, length: {maximum: 200}, presence: true
  validates :price_low, presence: true
  validates :price_high, presence: true
  validates :date, presence: true

end
