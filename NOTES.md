Cryptocurrency Trade Tracker

Database
- rake db:create_migration NAME=create_users
  create_table :users do |t|
    t.string :username
    t.string :email
    t.string :password_digest
  end

<!-- - rake db:create_migration NAME=create_portfolios
  create_table :portfolios do |t|
    t.string :portfolio_name
    t.integer :user_id
  end

  create another table when you feel comfortable getting the first level deep working -->

- rake db:create_migration NAME=create_trades
  create_table :trades do |t|
    t.string :name_symbol
    t.integer :buy_value_fiat
    t.integer :buy_value_satoshi
    t.integer :sell_value_fiat
    t.integer :sell_value_satoshi
    t.integer :user_id
    t.integer :year_id
  end

- rake db:create_migration NAME=create_calendar_years
  create_table :years do |t|
    t.integer :year
  end

Models
- Trades belong to a user, belong to a year
- User has many trades, has many years through trades
- Year has many users, users have many years (many-to-many relationship)
  (is this many-to-many relationship even necessary? get help.)

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

- Years traded: is still showing 2018 twice. Need to get find_or_create_by method working.
