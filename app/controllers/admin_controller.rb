class AdminController < ApplicationController
	before_action :authenticate_admin!

  def index
  end

  def order 
  	@orders = Order.joins(:user).joins(:driver).where.not(finish_datetime: nil).order('finish_datetime DESC')
    gon.orders = @orders
  end

  def driver 
  	# id = Driver.ids
  	# @drivers = Driver.joins(:order).where(driver_id: id)
  end
end
