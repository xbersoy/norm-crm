class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :name
      t.integer :company_id
      t.integer :category_id
      t.string :currency
      t.float :net_price

      t.timestamps
    end
  end
end
