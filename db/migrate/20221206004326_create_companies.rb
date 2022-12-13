# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.bigint 'owner_id'
      t.string 'name', limit: 255, default: '', null: false
      t.string 'legal_name', collation: 'tr_TR'
      t.string 'tax_number'
      t.string 'tax_office'
      t.string 'occupation_field'
      t.string 'contact_person'
      t.string 'contact_phone_number'
      t.string 'logo'
      t.string 'district'
      t.string 'city'
      t.string 'owner_email'
      t.date 'trial_end_date'
      t.index ['owner_id'], name: 'index_companies_on_owner_id'
      t.timestamps
    end
  end
end
