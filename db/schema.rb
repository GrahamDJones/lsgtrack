# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20121231025325) do

  create_table "assets", :force => true do |t|
    t.string   "asset_file_name"
    t.integer  "asset_file_size"
    t.string   "asset_content_type"
    t.datetime "asset_updated_at"
    t.integer  "ticket_id"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  create_table "comments", :force => true do |t|
    t.text     "text"
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "state_id"
    t.integer  "previous_state_id"
  end

  add_index "comments", ["ticket_id"], :name => "index_comments_on_ticket_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "delayed_jobs", ["priority", "run_at"], :name => "delayed_jobs_priority"

  create_table "permissions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "thing_id"
    t.string   "thing_type"
    t.string   "action"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "permissions", ["thing_id"], :name => "index_permissions_on_thing_id"
  add_index "permissions", ["user_id"], :name => "index_permissions_on_user_id"

  create_table "projects", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "state_id"
  end

  add_index "projects", ["state_id"], :name => "index_projects_on_state_id"

  create_table "states", :force => true do |t|
    t.string   "name"
    t.string   "color"
    t.string   "background"
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
    t.boolean  "default",       :default => false
    t.string   "state_type"
    t.boolean  "is_admin_only", :default => false
  end

  create_table "tags", :force => true do |t|
    t.string "name"
  end

  add_index "tags", ["name"], :name => "index_tags_on_name", :unique => true

  create_table "tags_tickets", :id => false, :force => true do |t|
    t.integer "tag_id"
    t.integer "ticket_id"
  end

  add_index "tags_tickets", ["tag_id"], :name => "index_tags_tickets_on_tag_id"
  add_index "tags_tickets", ["ticket_id"], :name => "index_tags_tickets_on_ticket_id"

  create_table "ticket_watchers", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "ticket_id"
  end

  add_index "ticket_watchers", ["ticket_id"], :name => "index_ticket_watchers_on_ticket_id"
  add_index "ticket_watchers", ["user_id"], :name => "index_ticket_watchers_on_user_id"

  create_table "tickets", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.integer  "project_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "user_id"
    t.integer  "state_id"
  end

  add_index "tickets", ["project_id"], :name => "index_tickets_on_project_id"
  add_index "tickets", ["state_id"], :name => "index_tickets_on_state_id"
  add_index "tickets", ["user_id"], :name => "index_tickets_on_user_id"

  create_table "time_entries", :force => true do |t|
    t.integer  "ticket_id"
    t.integer  "user_id"
    t.date     "work_date"
    t.integer  "duration_minutes"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "time_entries", ["ticket_id"], :name => "index_time_entries_on_ticket_id"
  add_index "time_entries", ["user_id"], :name => "index_time_entries_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "authentication_token"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.boolean  "admin",                  :default => false
    t.string   "name"
  end

  add_index "users", ["authentication_token"], :name => "index_users_on_authentication_token", :unique => true
  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
