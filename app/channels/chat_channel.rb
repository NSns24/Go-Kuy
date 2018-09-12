class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def sendMsg(data)
  	if !data['id'].nil?
  		ActionCable.server.broadcast 'chat', msg: data['msg'], id: data['id'], type: data['type']
  	end
  end
end
