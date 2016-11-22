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
        App.global_chat.send_message " 님이 입장하였습니다.", messages.data('chat-room-id')
      disconnected: ->
        # Called when the subscription has been terminated by the server
      received: (data) ->
        messages.append data['message']

        if (data['user'] == "admin")
        else if (data['user'] == userEmail )
          $('.new').addClass("right");
          $('.new').removeClass("new");
        else
          $('.new').addClass("left");
          $('.new').removeClass("new");

        $('.new').removeClass("new");
        messages_to_bottom()

      send_message: (message, chat_room_id) ->
        @perform 'send_message', message: message, chat_room_id: chat_room_id

    $('#new_message').submit (e) ->
      $this = $(this)
      textarea = $this.find('#message_body')
      if $.trim(textarea.val()).length > 0
        App.global_chat.send_message textarea.val(), messages.data('chat-room-id')
        textarea.val('')
      e.preventDefault()
      return false

    $('#exit_room').click () ->
      if confirm "정말 나가시겠습니까?"
        App.global_chat.unsubscribe()
        App.global_chat.send_message " 님이 나가셨습니다", messages.data('chat-room-id')
        location.replace("/chat_rooms");

      else
