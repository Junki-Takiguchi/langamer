class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = current_user.chat_rooms
    @chat_users = @chat_rooms.map {|room|
      room.get_speaker(room, current_user)
    }
  end


end
