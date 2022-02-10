class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :message, null: false
      t.references :user, foreign_key: true, null: false
      t.references :chat_room, foreign_key: true, null: false
      t.timestamps
    end
  end
end
