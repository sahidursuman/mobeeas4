class CreateSchoolYearOpportunities < ActiveRecord::Migration
  def change
    create_table :school_year_opportunities do |t|
      t.references :school_year, index: true, foreign_key: true
      t.references :opportunity, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
