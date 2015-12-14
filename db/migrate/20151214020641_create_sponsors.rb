class CreateSponsors < ActiveRecord::Migration
  def change
    create_table :sponsors do |t|
      t.string :first_name
      t.string :last_name
      t.string :organisation
      t.string :position
      t.string :phone1
      t.string :phone2
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.string :guid
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
