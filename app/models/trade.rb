class Trade < ActiveRecord::Base
  belongs_to :user

  def net_profitloss_fiat
    
  end
end
