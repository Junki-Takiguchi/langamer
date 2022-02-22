class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def self.already_created_records?(current_user, other_user)
    current_user_rooms = Participant.where(user_id: current_user.id).pluck(:chat_room_id)
    other_user_rooms = Participant.where(user_id: other_user.id).pluck(:chat_room_id)
    match_room = current_user_rooms & other_user_rooms
    match_room.present?
  end
end
