class CreateTimeEntries < ActiveRecord::Migration
  def change
    create_table :time_entries do |t|
      t.references :ticket
      t.references :user
      t.date :work_date
      t.integer :duration_minutes

      t.timestamps
    end
    add_index :time_entries, :ticket_id
    add_index :time_entries, :user_id
  end
end
