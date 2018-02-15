class User < ActiveRecord::Base
  has_secure_password
  has_many :trades
  has_many :years, through: :trades
end
