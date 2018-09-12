App.order = App.cable.subscriptions.create "OrderChannel",
  connected: ->
    console.log('Order Connected')

  disconnected: ->
    console.log('Order Disconnected')
    