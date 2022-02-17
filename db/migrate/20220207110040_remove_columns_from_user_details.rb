class RemoveColumnsFromUserDetails < ActiveRecord::Migration[6.0]
  def change
    remove_column :user_details, :learn_language, :string
    remove_column :user_details, :first_language, :string
    remove_column :user_details, :second_language, :string
    remove_column :user_details, :second_language_status, :integer
  end
end
