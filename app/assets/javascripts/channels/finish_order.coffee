App.finish_order = App.cable.subscriptions.create "FinishOrderChannel",
  connected: ->
    console.log('Finish Order Connected')

  disconnected: ->
    console.log('Finish Order Disconnected')
