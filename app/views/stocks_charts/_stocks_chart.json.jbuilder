json.extract! stocks_chart, :id, :date, :open, :high, :low, :close, :volume, :value, :created_at, :updated_at
json.url stocks_chart_url(stocks_chart, format: :json)
