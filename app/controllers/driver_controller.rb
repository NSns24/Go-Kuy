class DriverController < ApplicationController
  before_action :authenticate_driver!
  
  def index
  end

  def profile
  end

  def job
  	session.delete(:excludedOrder)
  end

  def history
    @order = Order.where(driver_id: current_driver.id).joins(:user)
  end

  def getCustomer 
  	currentLoc = params[:currentLoc]

  	excludeOrder(params[:exOrder])

  	customer = nil
  
  	customers = OnlineUser.where.not(id: session[:excludedOrder])

  	customers.each do |x|
      if approxDistance(x.pickup_lat, x.pickup_lng, currentLoc[:lat].to_f, currentLoc[:lng].to_f) <= 5
        customer = x
     		break
    	end
  	end

  	if customer.nil?
  		return render json: { status: 'Failed' }
  	else
  		return render json: { status: 'Success', data: customer }
  	end
  end

  def approxDistance(lat1, lng1, lat2, lng2)
  	r = 6371 #Radius of the earth in km
    dLat = degToRad(lat2 - lat1)
  	dLng = degToRad(lng2 - lng1)

    a = Math.sin(dLat/2) ** 2 + Math.cos(degToRad(lat1)) * Math.cos(degToRad(lat2)) * Math.sin(dLng/2) ** 2
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
    dist = r * c 
    return dist.round(2) #Distance in km
  end

  def degToRad(deg) 
  	return deg * (Math::PI / 180)
  end

  def excludeOrder(exOrder)
  	if session[:excludedOrder].nil?
  		session[:excludedOrder] = []
  	else
  		if !exOrder.nil? && !exOrder.empty?
  			session[:excludedOrder].push(exOrder)
  		end
  	end 
  end
end
