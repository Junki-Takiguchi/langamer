class CreateParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :participants do |t|
      t.timestamps
      t.references :user, foreign_key: true, null: false
    end
  end
end
