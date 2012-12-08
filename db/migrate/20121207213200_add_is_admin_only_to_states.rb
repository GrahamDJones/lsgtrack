class AddIsAdminOnlyToStates < ActiveRecord::Migration
  def change
    add_column :states, :is_admin_only, :boolean, default: false
  end
end
