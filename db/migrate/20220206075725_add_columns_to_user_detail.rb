class AddColumnsToUserDetail < ActiveRecord::Migration[6.0]
  def change
    add_column :user_details, :second_language_status, :integer, default: 0, null: false, limit: 2
    add_column :user_details, :living_country_status, :integer, default: 0, null: false, limit: 2
    add_column :user_details, :native_country_status, :integer, default: 0, null: false, limit: 2
    add_column :user_details, :date_of_birth_status, :integer, default: 0, null: false, limit: 2
    add_column :user_details, :gender_status, :integer, default: 0, null: false, limit: 2
  end
end
