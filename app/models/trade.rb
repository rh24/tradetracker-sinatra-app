class Trade < ActiveRecord::Base
  belongs_to :user

  def net_profitloss_fiat
    (self.sell_value_fiat - self.buy_value_fiat)
  end
end
