class Year < ActiveRecord::Base
  has_many :user_years
  has_many :users, through: :user_years
  has_many :trades, through: :users
end
