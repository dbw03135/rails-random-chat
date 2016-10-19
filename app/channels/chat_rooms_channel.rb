# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class ChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_rooms_#{params['chat_room_id']}_channel"
    print "------------접속완료"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    current_user.messages.create!(body: " 님이 퇴장하셨습니다", chat_room_id: params['chat_room_id'])
    stop_all_streams
  end

  def send_message(data)
    current_user.messages.create!(body: data['message'], chat_room_id: data['chat_room_id'])
  end

end
