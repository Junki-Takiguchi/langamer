class RemoveColumnsFromGameRelations < ActiveRecord::Migration[6.0]
  def change
    remove_column :game_relations, :game_id, :integer
    remove_column :game_relations, :game_platform_id, :integer
    remove_column :game_relations, :user_id, :integer
  end
end
