jQuery(document).on 'turbolinks:load', ->
  messages = $('#messages')
  if $('#messages').length > 0
    messages_to_bottom = -> messages.scrollTop(messages.prop("scrollHeight"))

    messages_to_bottom()

    App.global_chat = App.cable.subscriptions.create {
        channel: "ChatRoomsChannel"
        chat_room_id: messages.data('chat-room-id')
      },
      connected: ->
        # Called when the subscription is ready for use on the server
        @perform 'send_message', message: " 님이 입장하셨습니다", chat_room_id: messages.data('chat-room-id')

      disconnected: ->
        # Called when the subscription has been terminated by the server
        #@perform 'send_message', message: " 님이 퇴장하셨습니다", chat_room_id: messages.data('chat-room-id')
        @printMessage("what the fuck")

      received: (data) ->
        messages.append data['message']
        messages_to_bottom()

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

      printMessage: (message) ->
        messages.append message
        messages_to_bottom()


    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 0
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false
