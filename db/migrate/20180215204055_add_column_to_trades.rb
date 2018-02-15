class AddColumnToTrades < ActiveRecord::Migration[5.1]
  def change
    add_column :trades, :note, :text
  end
end
