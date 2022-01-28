class GameAccount < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :discord_id, length: { maximum: 37}
  validates :twitter_id, length: { maximum: 15}

  with_options length: { maximum: 32} do
    validates :title
    validates :content
    validates :due_date
    validates :status
    validates :priority
  end

end
