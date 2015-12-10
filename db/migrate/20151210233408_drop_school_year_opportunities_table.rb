class DropSchoolYearOpportunitiesTable < ActiveRecord::Migration
  def change
    drop_table :school_year_opportunities
  end
end
