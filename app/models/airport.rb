class Airport < ApplicationRecord
  has_many :outbound, class_name: "Fly", foreign_key: "from_id", dependent: :destroy 
  has_many :inbound, class_name: "Fly", foreign_key: "to_id", dependent: :destroy 
end
