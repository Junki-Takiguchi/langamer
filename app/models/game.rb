class Game < ApplicationRecord
  belongs_to :user
  has_many :game_relations, dependent: :destroy
  has_many :game_relation_game_platforms, through: :game_relations, source: :game_platform
  validates :name, presence: true, length: { maximum: 64}
  validates :content, length: { maximum: 255}
end
