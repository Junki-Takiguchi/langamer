class CreateLearnLanguages < ActiveRecord::Migration[6.0]
  def change
    create_table :learn_languages do |t|
      t.string :learn_language
      t.integer :learn_language_status
      t.timestamps
      t.references :user, foreign_key: true
    end
  end
end
