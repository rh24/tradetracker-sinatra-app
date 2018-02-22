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


- Can you have a three table join?
UserYearTrade

- Do I want to make one show page for users instead of show.erb private_show.erb?
- In years views, trades are printing twice. This was an issue caused by trying to use a while i < @trades.length loop that still printed every viewable trade for the length of the entire @trades array. So, if there were private trades in the array, the viewable ones printed multiple times to compensate for the private ones.

- If user deletes account, all data input by that user must be deleted as well.

<!-- - Make views for Years. 2017, 2018, etc. -->
<!-- - Must limit content editing to the user who created that content. -->
- How do I correctly insert checked if for radio buttons and consequently alter the value of @trade.viewable? Adding the checked if made my @trade.viewable static. I could not log the new value if changed from true to false.
<!-- - *User input must be validated (controller is fine) to ensure that bad data isn't created
Any validation failures must be shown to user with an error message -->

Future reference -
How can I update numbering and unique ids? Or is it better practice to never replace unique ids even though records have been deleted?
