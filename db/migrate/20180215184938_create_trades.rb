class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.boolean :private, default: false
      t.string :coin_symbol
      t.integer :buy_value_fiat
      t.integer :buy_value_satoshi
      t.integer :sell_value_fiat
      t.integer :sell_value_satoshi
      t.integer :net_profitloss_fiat
      t.integer :net_profitloss_satoshi
      t.integer :user_id
    end
  end
end
