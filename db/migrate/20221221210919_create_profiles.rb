class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.bigint :user_id
      t.string :phone
      t.string :job_title
      t.text :avatar
      t.json :settings
      t.string :unverified_phone

      t.timestamps
    end
  end
end
