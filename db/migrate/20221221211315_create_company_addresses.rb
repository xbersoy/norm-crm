class CreateCompanyAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :company_addresses do |t|
      t.string :name
      t.text :address
      t.string :phone
      t.string :fax
      t.bigint :company_id

      t.timestamps
    end
  end
end
