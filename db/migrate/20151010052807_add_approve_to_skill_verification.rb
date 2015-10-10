class AddApproveToSkillVerification < ActiveRecord::Migration
  def change
    add_column :skill_verifications, :approve, :boolean
  end
end
