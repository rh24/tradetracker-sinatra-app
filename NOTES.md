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
    t.integer :user_id
  end

- rake db:create_migration NAME=create_calendar_years
  create_table :years do |t|
    t.integer :year
  end

Models
- User has many trades, has many years
- Year has many users
- Trades belong to a user

Views
- mkdir trades
  - edit.erb
  - index.erb # publicly viewable trades, users you follow, etc.
  - new.erb
  - show.erb
- mkdir users
  - show.erb
  - edit.erb # allow users to edit their information?
- homepage.erb
- login.erb
- logout.erb
- signup.erb

Controller
- ApplicationController
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
