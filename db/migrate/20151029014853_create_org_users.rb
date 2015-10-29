class CreateOrgUsers < ActiveRecord::Migration
  def change
    create_table :org_users do |t|
      t.boolean :admin_status, default: false
      t.boolean :verified_status, default: false
      t.references :organisation, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
