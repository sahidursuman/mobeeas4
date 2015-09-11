class CreateOrganisations < ActiveRecord::Migration
  def change
    create_table :organisations do |t|
      t.references :organisation_type, index: true, foreign_key: true
      t.string :name
      t.string :contact_name
      t.string :contact_email
      t.string :contact_phone
      t.string :address
      t.string :suburb
      t.string :state
      t.string :postcode
      t.string :country
      t.string :logo
      t.string :website
      t.string :acara_school_id
      t.string :school_type
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
end
