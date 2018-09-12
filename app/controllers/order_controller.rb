class OrderController < ApplicationController
  before_action :authenticate_user!, only: [:checkOrderUser, :saveRating]
  before_action :authenticate_driver!, only: [:createOrder, :startWorking, :finishWorking, :checkOrderDriver]

  def createOrder
    order = Order.new do |x|
      x.driver_id = current_driver.id
      x.user_id = params[:order][:user_id]
      x.pickup_lat = params[:order][:pickup_lat]
      x.pickup_lng = params[:order][:pickup_lng]
      x.dest_lat = params[:order][:dest_lat]
      x.dest_lng = params[:order][:dest_lng]
      x.distance = params[:distance]
    end

    user =  OnlineUser.find(params[:order][:id])
   
    if user.destroy
      if order.save
        order_success = Order.joins(:driver).select('orders.*, drivers.name, drivers.phone, drivers.license_plate').find(order.id)
        ActionCable.server.broadcast 'order', order: order_success
        return render json: order_success
      end
    end

    return render json: nil
  end

  def checkOrderUser
    order = Order.joins(:driver).select('orders.*, drivers.name, drivers.phone, drivers.license_plate').where(user_id: current_user.id, finish_datetime: nil).first
    return render json: order
  end

  def checkOrderDriver
    order = Order.where(driver_id: current_driver.id, finish_datetime: nil).first
    return render json: order
  end

  def startWorking
    order = Order.find(params[:order_id])

    if !order.nil?
      order.pickup_datetime = Time.zone.now()
      order.save
    end

    return render json: order
  end

  def finishWorking
    order = Order.find(params[:order_id])

    if !order.nil?
      order.finish_datetime = Time.zone.now()

      if order.save
        ActionCable.server.broadcast 'finish_order', order: order
      end
    end

    return render json: order
  end

  def saveRating
    comments = (params[:comments].strip == '') ? nil : params[:comments].strip

    if params[:no_helm].to_i == 1
      if comments.nil?
        comments = "This Driver doesn't provide helm."
      else
        comments += " This Driver doesn't provide helm."
      end
    end

    order = Order.find(params[:id]);
    order.rating = params[:rating]
    order.comment = comments

    if order.save
      return render json: { status: 'Success', message: 'Thank you for your rating' }
    else
      return render json: { status: 'Failed', message: 'Error while processing data' }
    end
  end
end