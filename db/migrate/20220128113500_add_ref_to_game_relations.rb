class AddRefToGameRelations < ActiveRecord::Migration[6.0]
  def change
    add_reference :game_relations, :game, null: false, foreign_key: true
    add_reference :game_relations, :game_platform, null: false, foreign_key: true
  end
end
