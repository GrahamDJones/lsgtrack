class AddInheritanceColumnToStates < ActiveRecord::Migration
  def change
    add_column :states, :state_type, :string
  end
end
