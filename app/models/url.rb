class Url < ApplicationRecord
    self.primary_key = "company_code"
    has_many:StocksChart, :foreign_key => "c_code"
    
end
