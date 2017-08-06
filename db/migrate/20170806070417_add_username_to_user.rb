class AddUsernameToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :username, :string, unique: true
    add_column :users, :role, :string
  end
end
