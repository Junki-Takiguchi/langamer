class AddUserRefToRecruitments < ActiveRecord::Migration[6.0]
  def change
    add_reference :recruitments, :user, null: false, foreign_key: true
  end
end
