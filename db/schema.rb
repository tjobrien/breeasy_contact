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

ActiveRecord::Schema.define(:version => 20130314021720) do

  create_table "affiliate_details", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "company"
    t.string   "address"
    t.string   "city"
    t.string   "state"
    t.string   "post_code"
    t.string   "url"
    t.string   "affiliate_code"
    t.string   "affiliate_url"
    t.boolean  "accepted_terms"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "user_id"
    t.string   "country"
    t.string   "phone"
    t.string   "title"
    t.integer  "bfb_id"
    t.string   "website"
  end

  create_table "contact_lists", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "contacts", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "company"
    t.text     "description"
    t.string   "phone"
    t.string   "twitter"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.boolean  "breeasy"
    t.boolean  "marketing"
    t.boolean  "white_label"
    t.string   "contact_method"
    t.boolean  "referral"
    t.boolean  "bbc"
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.decimal  "new"
    t.decimal  "renewal"
    t.boolean  "active"
    t.integer  "interval"
    t.integer  "plan_id"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.boolean  "master",         :default => false
    t.decimal  "sub_commission"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.boolean  "active"
    t.string   "url_path"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "promo_codes", :force => true do |t|
    t.string   "promo_code"
    t.string   "affiliate_id"
    t.date     "start_date"
    t.string   "end_date"
    t.text     "description"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "urls", :force => true do |t|
    t.integer  "user_id"
    t.string   "program_description"
    t.string   "url"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.string   "link"
    t.integer  "program_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "password_hash"
    t.string   "password_salt"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.boolean  "master"
    t.integer  "master_id"
  end

end
