class ChatRoomsController < ApplicationController
  def show
    @chatroom = ChatRoom.find(params[:id])
  end
end
