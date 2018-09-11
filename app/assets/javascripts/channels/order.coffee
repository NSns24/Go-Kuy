App.order = App.cable.subscriptions.create "OrderChannel",
  connected: ->
    console.log('Connected')

  disconnected: ->
    console.log('Disconnected')
    