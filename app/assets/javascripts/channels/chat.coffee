App.chat = App.cable.subscriptions.create "ChatChannel",
  connected: ->
    console.log('Chat Connected')

  disconnected: ->
    console.log('Chat Disconnected')

  sendMsg: (msg, id, type) ->
    @perform 'sendMsg', msg: msg, id: id, type: type
