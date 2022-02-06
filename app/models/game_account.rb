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

  enum discord_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum steam_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum origin_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum riot_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum psn_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum xbox_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum nintendo_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum other_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true
  enum twitter_id_status: { "公開": 0, "非公開": 1, "フレンドのみ公開": 2 }, _prefix: true

end
