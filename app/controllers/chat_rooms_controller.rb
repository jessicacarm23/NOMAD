class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
    @receiver = User.find(params[:user_id])
  end

  def create
    chatroom = ChatRoom.find_by(user_receiver_id: params[:user_id])
    receiver = User.find(params[:user_id])

    if chatroom.nil?
      new_chatroom = ChatRoom.create(user_receiver_id: params[:user_id],user_initiator_id:current_user.id, name:"Chatroom with #{receiver.name}")
      redirect_to user_chat_room_path(receiver.id, new_chatroom.id)
    else
      redirect_to user_chat_room_path(receiver.id, chatroom.id)
    end
  end
end
