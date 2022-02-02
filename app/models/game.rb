class Game < ApplicationRecord
  belongs_to :user
  has_many :game_relations, dependent: :destroy
  has_many :game_relation_game_platforms, through: :game_relations, source: :game_platform
  accepts_nested_attributes_for :game_relations, allow_destroy: true
  validates :name, presence: true, length: { maximum: 64}
  validates :game_picture, length: { maximum: 255}
end
