class CreateSpeakLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :speak_languages do |t|
      t.string :speak_language
      t.integer :rank, limit: 2, null: false
      t.integer :speak_language_status, limit: 2, default: 0, null: false
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
