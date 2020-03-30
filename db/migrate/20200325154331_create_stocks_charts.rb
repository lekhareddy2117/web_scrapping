class CreateStocksCharts < ActiveRecord::Migration[6.0]
  def change
    create_table :stocks_charts do |t|
      t.string :c_code
      t.date :date
      t.float :open
      t.float :high
      t.float :low
      t.float :close
      t.bigint :volume
      t.float :value
      
      t.timestamps
    end
  end
end
