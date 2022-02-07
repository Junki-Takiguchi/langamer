class CreateSpeakLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :speak_languages do |t|
      t.string :speak_language
      t.boolean :native_language, default: false, null: false
      t.integer :speak_language_status
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
