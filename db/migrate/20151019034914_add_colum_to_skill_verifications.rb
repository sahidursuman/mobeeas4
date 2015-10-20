class AddColumToSkillVerifications < ActiveRecord::Migration
  def change
    add_column :skill_verifications, :message, :text
  end
end
