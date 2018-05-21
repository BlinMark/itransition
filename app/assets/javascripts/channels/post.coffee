App.post = App.cable.subscriptions.create "PostChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    alert data['comment']

  speak: (comment) ->
    @perform 'speak', comment: comment

$(document).on 'keypress', '[data-behavior~=post_speaker]', (event) ->
  if event.keyCode is 13
    App.post.speak event.target.value
    event.target.value = ''
    event.preventDefault()