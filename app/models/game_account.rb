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

  enum discord_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum steam_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum origin_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum riot_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum psn_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum xbox_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum nintendo_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum other_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }
  enum twitter_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }

end
