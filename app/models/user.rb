class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :username, :email, :password
  has_many :trades
  # has_many :years, through: :trades
  has_many :user_years
  has_many :years, through: :user_years

  def slug
    slugged = self.username.downcase.gsub(/[^0-9A-Za-z]/, '-')
    slugged
  end

  def self.find_by_slug(slug)
    self.all.detect do |user|
      user if user.slug == slug
    end
  end
end
