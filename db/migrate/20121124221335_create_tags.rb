class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
    end
    add_index :tags, :name, :unique => true

    create_table :tags_tickets, id: false do |t|
      t.integer :tag_id, :ticket_id
    end
    add_index :tags_tickets, :tag_id
    add_index :tags_tickets, :ticket_id
  end
end
