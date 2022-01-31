class RenameColumnsToFriendRelations < ActiveRecord::Migration[6.0]
  def change
    rename_column :friend_relations, :from_applicant, :from_applicant_id
    rename_column :friend_relations, :to_target, :to_target_id
  end
end
