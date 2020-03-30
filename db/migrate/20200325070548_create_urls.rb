class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :company_name
      t.string :company_code

      t.timestamps
    end
    add_index :urls, :company_code,                unique: true
  end
end
