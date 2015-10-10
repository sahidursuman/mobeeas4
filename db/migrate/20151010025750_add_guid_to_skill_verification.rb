class AddGuidToSkillVerification < ActiveRecord::Migration
  def change
    add_column :skill_verifications, :guid, :string
    add_index :skill_verifications, :guid
  end
end
