App.finish_order = App.cable.subscriptions.create "FinishOrderChannel",
  connected: ->
    console.log('Connected')

  disconnected: ->
    console.log('Disconnected')
