class GameAccount < ApplicationRecord
  belongs_to :user, dependent: :destroy

  validates :discord_id, length: { maximum: 37}
  validates :twitter_id, length: { maximum: 15}

  with_options length: { maximum: 32} do
    validates :steam_id
    validates :origin_id
    validates :riot_id
    validates :psn_id
    validates :xbox_id
    validates :nintendo_id
    validates :other_id
  end

end
