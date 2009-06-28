# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090519152714) do

  create_table "arts", :force => true do |t|
    t.integer  "subject_id"
    t.integer  "user_id"
    t.string   "image"
    t.text     "describe"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "comments", :force => true do |t|
    t.integer  "art_id"
    t.integer  "user_id"
    t.string   "user_mail"
    t.text     "message"
    t.integer  "digg"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "follows", :force => true do |t|
    t.integer  "user_id"
    t.integer  "the_followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "notes", :force => true do |t|
    t.integer  "user_id"
    t.integer  "from_user_id"
    t.string   "from_user_mail"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "subjects", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.integer  "art_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "udetails", :force => true do |t|
    t.integer  "user_id"
    t.string   "nike_name"
    t.string   "image"
    t.text     "about_me"
    t.integer  "art_amount"
    t.integer  "login_amount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "state",                                   :default => "passive"
    t.datetime "deleted_at"
  end

end
