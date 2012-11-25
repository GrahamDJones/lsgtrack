class CreateTicketWatchersTable < ActiveRecord::Migration
  def change
    create_table :ticket_watchers, id: false do |t|
      t.integer :user_id, :ticket_id
    end
    add_index :ticket_watchers, :user_id
    add_index :ticket_watchers, :ticket_id
  end
end
