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
    <!-- t.integer :year_id -->
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

- Sanitize input to not allow blank input fields.
- Make views for Years. 2017, 2018, etc.
<!-- - Must limit content editing to the user who created that content. -->
- How do I correctly insert checked if for radio buttons and consequently alter the value of @trade.viewable? Adding the checked if made my @trade.viewable static. I could not log the new value if changed from true to false.
- *User input must be validated (controller is fine) to ensure that bad data isn't created
Any validation failures must be shown to user with an error message
- Why does the first logged trade never show?
- fix bytesize error
