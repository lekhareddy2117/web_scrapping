class AddCompanynameToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :company_name, :string
  end
end
