class AddUnpaidVolunteerToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :unpaid_volunteer, :boolean, default: false
  end
end
