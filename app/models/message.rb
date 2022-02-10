class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :message, length: { maximum: 1000}

  enum gender: { "未読": 0, "既読": 1 }

  private

  def update_status
    message.update(read: 1)
  end
end
