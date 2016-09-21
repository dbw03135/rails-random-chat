class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = ChatRoom.all
  end

  def new
    @chat_room = ChatRoom.new
  end

  def create
    @chat_room = current_user.chat_rooms.build(chat_room_params)
    if @chat_room.save
      flash[:success] = 'Chat room added!'
      redirect_to chat_rooms_path
    else
      render 'new'
    end
  end

  def show
    @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
    if current_user != @chat_room.user
      @chat_room.user_2 = current_user.id
      @chat_room.save
    end
    @message = Message.new

    if @chat_room.user_2
      @user2 = User.find(@chat_room.user_2).name
    else
      @user2 = "기다리는중"
    end
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:title)
  end
end
