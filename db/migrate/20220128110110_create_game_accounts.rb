class CreateGameAccounts < ActiveRecord::Migration[6.0]
  def change
    create_table :game_accounts do |t|
      t.string :discord_id
      t.string :steam_id
      t.string :origin_id
      t.string :riot_id
      t.string :psn_id
      t.string :xbox_id
      t.string :nintendo_id
      t.string :other_id
      t.string :twitter_id
      t.timestamps
    end
  end
end
