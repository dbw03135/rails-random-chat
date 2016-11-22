class ChatRoomsController < ApplicationController
  def index

  end

  def search
    empty_room = ChatRoom.find_by(user2: nil)
    if (empty_room != nil )
      chat_room = empty_room
      redirect_to chat_room_path(chat_room)
    else
      redirect_to new_chat_room_path
    end
  end

  def new
    @chat_room = ChatRoom.new
    @chat_room = current_user.chat_rooms.build
    @chat_room.save
    redirect_to chat_room_path(@chat_room)
  end

  def create

  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    if current_user != @chat_room.user
      @chat_room.user2 = current_user
      @chat_room.save
    end
    @message = Message.new

  end

  def exit

  end


  #def destroy
  #  @chat_room = ChatRoom.find(params[:id])
  #  @chat_room.destroy
  #  redirect_to '/'
  #  flash[:error] = "Post was destroyed!"
  #end



  private


end
