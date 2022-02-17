class CreateUserDetails < ActiveRecord::Migration[6.0]
  def change
    create_table :user_details do |t|
      t.string :account_name
      t.text :profile_picture
      t.text :self_introduction
      t.string :learn_language
      t.string :first_language
      t.string :second_language
      t.string :living_country
      t.string :native_country
      t.date :date_of_birth
      t.string :gender, limit: 2
      t.timestamps
    end
  end
end
