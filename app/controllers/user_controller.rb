class UserController < ApplicationController
  #before_action :authenticate_user!

  def index
  end

  def profile
  end

  def order
  end

  def orderDriver
  	# pickupLoc = params[:pickupLoc]
  	# destLoc = params[:destLoc]

  	# onlineUser = OnlineUser.new do |x|
  	# 	x.user_id = current_user.id
  	# 	x.pickup_lat = pickupLoc.lat
  	# 	x.pickup_lng = pickupLoc.lng
  	# 	x.dest_lat = destLoc.lat
  	# 	x.dest_lng = destLoc.lng 
  	# end

  	# @driver = nil

  	# while @driver != nil
  	# 	drivers = OnlineDriver.all

  	# 	drivers.each do |x|
  	# 		if approxDistance(pickupLoc.lat, pickupLoc.lng, x.current_lat, x.current_lng) <= 5
  	# 			@driver = x
  	# 			break
  	# 		end
  	# 	end
  	# end
  	respond_to do |format|
     	format.json {render json: 1}
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
  	return deg * (Math.PI / 180)
  end
end
