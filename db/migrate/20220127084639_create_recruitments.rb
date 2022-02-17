class CreateRecruitments < ActiveRecord::Migration[6.0]
  def change
    create_table :recruitments do |t|
      t.string :title
      t.text :content
      t.timestamps
    end
  end
end
