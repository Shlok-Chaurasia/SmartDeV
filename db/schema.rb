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

ActiveRecord::Schema.define(:version => 20151022014642) do

  create_table "customer_addresses", :force => true do |t|
    t.integer "user_id"
    t.string  "name"
    t.string  "address"
    t.string  "landmark"
    t.integer "phone",    :limit => 8
    t.integer "zipcode"
  end

  create_table "customer_order_details", :force => true do |t|
    t.integer  "product_stock_id"
    t.integer  "customer_order_id"
    t.integer  "quantity",          :default => 1
    t.datetime "created_at",                       :null => false
    t.datetime "updated_at",                       :null => false
  end

  create_table "customer_orders", :force => true do |t|
    t.integer  "customer_id"
    t.string   "status"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "customers", :force => true do |t|
    t.integer  "user_sign_in_id"
    t.string   "name"
    t.integer  "phone"
    t.string   "address"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "product_descriptions", :force => true do |t|
    t.integer "product_id"
    t.text    "about"
    t.text    "benefits"
    t.text    "how_to_use"
  end

  create_table "product_stocks", :force => true do |t|
    t.integer  "product_id"
    t.float    "available_stock"
    t.string   "available_stock_unit"
    t.float    "mrp"
    t.float    "selling_price"
    t.boolean  "is_available"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "products", :force => true do |t|
    t.string   "name"
    t.string   "category_type"
    t.integer  "seller_id"
    t.float    "price"
    t.string   "image_url"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "slots", :force => true do |t|
    t.integer  "zipcode"
    t.datetime "slot_date_time"
    t.boolean  "is_active"
  end

  create_table "user_sign_ins", :force => true do |t|
    t.string   "user_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
