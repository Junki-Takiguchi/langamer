class Participant < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  def self.already_created_records?(current_user, other_user)
    Participant.exists?(user_id: current_user.id) || Participant.exists?(user_id: other_user.id)
  end
end
