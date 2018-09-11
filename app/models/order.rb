class Order < ApplicationRecord
	belongs_to :driver
	belongs_to :user
end
