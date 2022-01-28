class GameRelation < ApplicationRecord
  belongs_to :game
  belongs_to :game_platform
  belongs_to :user
end
