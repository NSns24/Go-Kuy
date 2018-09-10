class OnlineUser < ApplicationRecord
	validates :user_id, :pickup_lat, :pickup_lng, :dest_lat, :dest_lng, presence: true
	validates :user_id, numericality: { only_integer: true }
	validates :pickup_lat, :pickup_lng, :dest_lat, :dest_lng, numericality: true

	belongs_to :user
end
