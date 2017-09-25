class EditUser < ActiveRecord::Migration[5.1]
  def change
    #remove_column :users, :name
    rename_column :users, :name, :username
    remove_column :users, :email
    #add_column :users, :username, :string, null: false
    add_index :users, :username, unique: true
  end
end
