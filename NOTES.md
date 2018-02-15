Cryptocurrency Trade Tracker

Database
- rake db:create_migration NAME=create_users
  create_table :users do |t|
    t.string :username
    t.string :email
    t.string :password_digest
  end

# - rake db:create_migration NAME=create_coins
#   create_table :coins do |t|
#     t.string :coin_name
#     t.string :coin_symbol
#     t.integer :current_fiat_value
#     t.ingeter :current_satoshi_value
#   end

- rake db:create_migration NAME=create_trades
  create_table :trades do |t|
    t.string :name_symbol
    t.integer :buy_value_fiat
    t.integer :buy_value_satoshi
    t.integer :sell_value_fiat
    t.integer :sell_value_satoshi
  end

- rake db:create_migration NAME=create_calendar_years
  create_table :years do |t|
    t.integer :year
  end

Models
- User has many trades
- Trades belong to a user

Views
-

Controller
- ApplicationController
  configure do

  end
  helpers do

  end
  get '/' do

  end

- UsersController
  get '/users/:slug' do

  end # Remember to make trades optionally private / public!
  signup
  login
  logout

- TradesController
  '/trades'
  '/trades/new'
  '/trades/:id'
  '/trades/:id/edit'
  '/trades/:id/delete'
