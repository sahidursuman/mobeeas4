class AddTermsToEducation < ActiveRecord::Migration
  def change
    add_column :educations, :terms, :boolean
  end
end
