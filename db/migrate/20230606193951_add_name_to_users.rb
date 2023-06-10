class AddNameToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :name, :string
    add_column :users, :passport, :string
    add_column :users, :city, :string
    add_column :users, :bio, :string
  end
end