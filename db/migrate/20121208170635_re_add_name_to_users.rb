class ReAddNameToUsers < ActiveRecord::Migration
  def up
    add_column :users, :admin, :boolean, default: false
    add_column :users, :name, :string
    add_column :users, :request_count, :integer, default: 0

    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    add_index :users, :confirmation_token,   :unique => true
    add_index :users, :authentication_token, :unique => true
  end

  def down
  end
end
