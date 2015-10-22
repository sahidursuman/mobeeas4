class CreateOrgUserProfiles < ActiveRecord::Migration
  def change
    create_table :org_user_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :position
      t.boolean :admin_status, default: false
      t.boolean :verified_status, default: false
      t.string :guid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
    add_index :org_user_profiles, :guid
  end
end
