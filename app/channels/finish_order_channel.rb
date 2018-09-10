class FinishOrderChannel < ApplicationCable::Channel
  def subscribed
    stream_from "finish_order"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
