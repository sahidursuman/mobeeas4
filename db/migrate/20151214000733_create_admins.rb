class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :guid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
