class ChatRoomsController < ApplicationController
  def index
    @chat_rooms = current_user.chat_rooms.sort_by { |chat_room| chat_room.last_time(chat_room, current_user) }.reverse
    @chat_rooms = Kaminari.paginate_array(@chat_rooms).page(params[:page]).per(10)
    @chat_users = @chat_rooms.map {|room|
      room.get_speaker(room, current_user)
    }
  end
end
