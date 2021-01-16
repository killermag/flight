class Booking < ApplicationRecord
  belongs_to :passenger
  belongs_to :fly

  accepts_nested_attributes_for :passenger 
end
