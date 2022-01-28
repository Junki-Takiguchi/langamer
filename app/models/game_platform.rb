class GamePlatform < ApplicationRecord
  belongs_to :game_relations
  validates :name, presence: true, length: { maximum: 64}
  validates :content, length: { maximum: 255}
end
