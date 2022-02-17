class AddReadToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :read, :integer, default: 0, null: false, limit: 2
  end
end
