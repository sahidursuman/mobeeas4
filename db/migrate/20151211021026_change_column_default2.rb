class ChangeColumnDefault2 < ActiveRecord::Migration
  def change
    change_column :opportunity_school_years, :number_of_students, :integer, default: 0
  end
end
