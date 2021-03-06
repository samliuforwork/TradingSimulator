# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_29_012750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "portfolio_stocks", force: :cascade do |t|
    t.bigint "portfolio_id", null: false
    t.string "ticker"
    t.string "name"
    t.decimal "current_price"
    t.string "exchange"
    t.decimal "dividend_yield"
    t.decimal "dividend_per_share"
    t.integer "quantity"
    t.decimal "book_cost"
    t.decimal "market_value"
    t.decimal "gain_loss"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["portfolio_id"], name: "index_portfolio_stocks_on_portfolio_id"
  end

  create_table "portfolios", force: :cascade do |t|
    t.decimal "portfolio_value"
    t.decimal "gain_loss"
    t.decimal "investment_value"
    t.decimal "book_cost"
    t.decimal "cash"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_portfolios_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "portfolio_stocks", "portfolios"
  add_foreign_key "portfolios", "users"
end
