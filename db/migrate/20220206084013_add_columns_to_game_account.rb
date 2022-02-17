class AddColumnsToGameAccount < ActiveRecord::Migration[6.0]
  def change
    add_column :game_accounts, :discord_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :steam_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :origin_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :riot_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :psn_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :xbox_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :nintendo_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :other_id_status, :integer, default: 2, null: false, limit: 2
    add_column :game_accounts, :twitter_id_status, :integer, default: 2, null: false, limit: 2
  end
end
