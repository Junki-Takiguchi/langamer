class GamePlatform < ApplicationRecord
  has_many :game_relations, dependent: :destroy
  has_many :game_relation_games, through: :game_relations, source: :game
  validates :name, presence: true, length: { maximum: 64}
  validates :content, length: { maximum: 255}
end
