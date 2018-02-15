class CreateTrades < ActiveRecord::Migration[5.1]
  def change
    create_table :trades do |t|
      t.boolean :private, default: false
      t.string :coin_symbol
      t.integer :buy_value_fiat
      t.integer :sell_value_fiat
      t.integer :year_created
      # t.integer :buy_value_satoshi
      # t.integer :sell_value_satoshi
      t.integer :user_id
    end
  end
end
