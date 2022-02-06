class CreateFriendRelations < ActiveRecord::Migration[6.0]
  def change
    create_table :friend_relations do |t|
      t.integer :from_applicant
      t.integer :to_target
      t.integer :status, limit: 2
      t.timestamps
    end
    add_index :friend_relations, :from_applicant
    add_index :friend_relations, :to_target
    add_index :friend_relations, [:from_applicant, :to_target], unique: true
  end
end
