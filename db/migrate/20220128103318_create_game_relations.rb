class CreateGameRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :game_relations do |t|
      t.integer :game_id
      t.integer :game_platform_id
      t.timestamps
    end
  end
end
