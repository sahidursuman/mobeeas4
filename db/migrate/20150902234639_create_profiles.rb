class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.string :first_name
      t.string :last_name
      t.string :picture
      t.text :bio
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.string :phone
      t.string :website
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
