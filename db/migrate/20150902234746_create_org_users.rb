class CreateOrgUsers < ActiveRecord::Migration
  def change
    create_table :org_users do |t|
      t.references :user, index: true, foreign_key: true
      t.references :organisation, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
