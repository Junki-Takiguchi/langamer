class Game < ApplicationRecord
  has_many :game_relations, dependent: :destroy
  validates :name, presence: true, length: { maximum: 64}
  validates :content, length: { maximum: 255}
end