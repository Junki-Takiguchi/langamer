class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :message, length: { maximum: 1000}

  enum gender: { "未読": 0, "既読": 1 }

  def update_status(comment)
    comment.update(read: 1)
  end
end
