class CreateOrganisationTypes < ActiveRecord::Migration
  def change
    create_table :organisation_types do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
