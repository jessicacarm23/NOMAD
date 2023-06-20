class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
    @message = Message.new
  end
  
  def create
    chatroom_initiated_by_current_user = ChatRoom.find_by(user_receiver_id: params[:user_receiver_id], user_initiator_id: current_user.id )
    chatroom_initiated_by_params_user = ChatRoom.find_by(user_initiator_id: params[:user_receiver_id], user_receiver_id: current_user.id )
    if chatroom_initiated_by_current_user.present?
      redirect_to chat_rooms_path(@chatroom)
    elsif chatroom_initiated_by_params_user.present?
      redirect_to chat_rooms_path(@chatroom)
    else
    end
  end
end
