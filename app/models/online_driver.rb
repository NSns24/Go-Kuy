class OnlineDriver < ApplicationRecord
	validates :driver_id, :current_lat, :current_lng, presence: true
	validates :driver_id, numericality: { only_integer: true }
	validates :current_lat, :current_lng, numericality: true

	belongs_to :driver, :foreign_key => 'driver_id'
end
