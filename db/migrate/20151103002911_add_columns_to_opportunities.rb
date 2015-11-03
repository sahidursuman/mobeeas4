class AddColumnsToOpportunities < ActiveRecord::Migration
  def change
    add_column :opportunities, :paid_engagement, :boolean, default: false
    add_column :opportunities, :specific_skills, :text
    add_column :opportunities, :experiences, :text
    add_column :opportunities, :employment_terms, :text
  end
end
