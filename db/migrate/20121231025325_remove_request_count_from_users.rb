class RemoveRequestCountFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :request_count
  end

  def down
    add_column :users, :request_count, :integer, default: 0
  end
end
