class AddVerifiedToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :verified, :boolean, default: false
  end
end
