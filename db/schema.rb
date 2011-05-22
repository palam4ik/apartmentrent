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

ActiveRecord::Schema.define(:version => 20110413190216) do

  create_table "apartments", :force => true do |t|
    t.integer  "rooms",                :default => 1
    t.boolean  "internet",             :default => true
    t.boolean  "washing_machine",      :default => true
    t.integer  "num_persons",          :default => 1
    t.integer  "price"
    t.boolean  "conditioner",          :default => true
    t.boolean  "tv",                   :default => true
    t.boolean  "balcony",              :default => true
    t.string   "ru_address"
    t.string   "ro_address"
    t.string   "en_address"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "special",              :default => false
    t.text     "detailed_description"
  end

  create_table "pages", :force => true do |t|
    t.string   "url"
    t.string   "ro_title"
    t.string   "ru_title"
    t.string   "en_title"
    t.text     "ru_body"
    t.text     "en_body"
    t.text     "ro_body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email",                               :default => "", :null => false
    t.string   "encrypted_password",   :limit => 128, :default => "", :null => false
    t.string   "password_salt",                       :default => "", :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                       :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
