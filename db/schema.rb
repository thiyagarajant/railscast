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

ActiveRecord::Schema.define(:version => 20130129065204) do

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "comments", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "user_id"
    t.integer  "episode_id"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.integer  "parent_id",   :default => 0
    t.integer  "level",       :default => 0
  end

  create_table "episodes", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "note"
    t.integer  "category_id"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.string   "view_name"
    t.float    "avg_rating"
    t.integer  "view_count",           :default => 0
    t.integer  "episode_type",         :default => 0
  end

  create_table "feedbacks", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "likes", :force => true do |t|
    t.integer  "episode_id"
    t.integer  "no_of_like",   :default => 0
    t.integer  "no_of_unlike", :default => 0
    t.datetime "created_at",                  :null => false
    t.datetime "updated_at",                  :null => false
    t.integer  "user_id"
  end

  create_table "logins", :force => true do |t|
    t.string   "email"
    t.integer  "user_id"
    t.string   "uid"
    t.string   "provider"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "plans", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.float    "price"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "search_suggestions", :force => true do |t|
    t.string   "term"
    t.integer  "popularity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stars", :force => true do |t|
    t.float    "rating"
    t.integer  "episode_id"
    t.integer  "user_id"
    t.float    "average_rating"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "subscribe_transactions", :force => true do |t|
    t.integer  "subscription_id"
    t.string   "action"
    t.integer  "amount"
    t.boolean  "success"
    t.string   "authorization"
    t.string   "message"
    t.text     "params"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "response"
  end

  create_table "subscriptions", :force => true do |t|
    t.integer  "user_id"
    t.string   "ip_address"
    t.string   "card_type"
    t.date     "card_expires_on"
    t.datetime "created_at",            :null => false
    t.datetime "updated_at",            :null => false
    t.string   "name"
    t.string   "email"
    t.string   "stripe_card_token"
    t.string   "stripe_customer_token"
    t.integer  "plan_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "mobile_no"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "role_name",       :default => "user"
    t.integer  "total_price",     :default => 0
    t.datetime "purchased_at"
  end

end
