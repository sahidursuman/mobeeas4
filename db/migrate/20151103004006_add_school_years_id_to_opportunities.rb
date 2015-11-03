class AddSchoolYearsIdToOpportunities < ActiveRecord::Migration
  def change
    add_reference :opportunities, :school_year, index: true, foreign_key: true
  end
end
