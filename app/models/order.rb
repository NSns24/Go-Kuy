class Order < ApplicationRecord
	belongs_to :driver, :foreign_key => 'driver_id'
	belongs_to :user, :foreign_key => 'user_id'
end
