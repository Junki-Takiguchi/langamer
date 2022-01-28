class ChangeDatatypeGenderOfUserDetails < ActiveRecord::Migration[6.0]
  def change
    change_column :user_details, :gender, 'integer USING CAST(gender AS integer)'
  end
end
