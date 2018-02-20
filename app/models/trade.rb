class Trade < ActiveRecord::Base
  validates_presence_of :coin, :quantity, :buy_value_fiat, :sell_value_fiat, :date
  validates_inclusion_of :viewable, in: [true, false]
  belongs_to :user

  def net_profitloss_fiat
    (self.sell_value_fiat - self.buy_value_fiat)
  end

  def self.find_by_year(year)
    self.all.select do |t|
      t if t.date.include?(year.to_s)
    end
  end

  def self.create_years
    self.all.each do |t|
      Year.create(year: t.date())
    end
  end
end
