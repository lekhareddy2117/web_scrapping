class AddUrlToStocksChart < ActiveRecord::Migration[6.0]
  def change
    add_reference :stocks_charts, :url, null: false, foreign_key: true
  end
end
