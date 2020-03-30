class StocksChart < ApplicationRecord
    belongs_to :Url, :foreign_key => 'c_code'

end
