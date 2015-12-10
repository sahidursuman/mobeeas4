class CreateOpportunitySchoolYears < ActiveRecord::Migration
  def change
    create_table :opportunity_school_years do |t|
      t.references :opportunity, index: true, foreign_key: true
      t.references :school_year, index: true, foreign_key: true
      t.integer :number_of_students

      t.timestamps null: false
    end
  end
end
