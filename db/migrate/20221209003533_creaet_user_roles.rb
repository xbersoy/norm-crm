class CreaetUserRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :user_roles do |t|
      t.bigint 'user_id', null: false
      t.bigint 'company_id', null: false
      t.string 'accounts'
      t.string 'settings'
      t.string 'employees'
      t.bigint 'managed_employee_id'
      t.boolean 'active', default: true
      t.string 'user_role_type'
      t.index ['company_id'], name: 'index_user_roles_on_company_id'
      t.index ['managed_employee_id'], name: 'index_user_roles_on_managed_employee_id'
      t.index ['user_id', 'company_id'], name: 'index_user_roles_on_user_id_and_company_id', unique: true
      t.index ['user_id'], name: 'index_user_roles_on_user_id'

      t.timestamps
    end
  end
end
