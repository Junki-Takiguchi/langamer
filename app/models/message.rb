class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chat_room

  validates :message, presence: true, length: { maximum: 1000}

  enum read: { "未読": 0, "既読": 1 }

  def update_status(comment)
    comment.update(read: "既読")
  end

  def relative_post_date(created_at)
    sec = (Time.zone.now - created_at).round
    days = sec / (60 * 60 * 24)
      return "#{days}日前" unless days.zero?
    hours = sec / (60 * 60)
      return "#{hours}時間前" unless hours.zero?
    min = sec / 60
      return "#{min}分前" unless min.zero?
    "#{sec}秒前"
  end
end
