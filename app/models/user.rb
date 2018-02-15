class User < ActiveRecord::Base
  has_secure_password
  has_many :trades
  has_many :user_years
  has_many :years, through: :user_years
end
