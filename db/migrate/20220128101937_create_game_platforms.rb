class CreateGamePlatforms < ActiveRecord::Migration[6.0]
  def change
    create_table :game_platforms do |t|
      t.string :name
      t.text :game_platform_picture
      t.timestamps
    end
  end
end
