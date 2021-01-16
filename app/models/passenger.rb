class Passenger < ApplicationRecord
  has_many :bookings, dependent: :destroy  
end
