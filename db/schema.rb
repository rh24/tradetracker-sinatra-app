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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180215190407) do

  create_table "trades", force: :cascade do |t|
    t.boolean "private", default: false
    t.string "coin_symbol"
    t.integer "buy_value_fiat"
    t.integer "buy_value_satoshi"
    t.integer "sell_value_fiat"
    t.integer "sell_value_satoshi"
    t.integer "net_profitloss_fiat"
    t.integer "net_profitloss_satoshi"
    t.integer "user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.string "email"
    t.string "password_digest"
  end

  create_table "years", force: :cascade do |t|
    t.integer "year"
  end

end
