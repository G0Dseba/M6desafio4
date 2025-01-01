class AddIsKarinaToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :is_karina, :boolean
  end
end
