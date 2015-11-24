class ChangeColumnnDefault < ActiveRecord::Migration
  def change
    change_column :opportunities, :opportunity_status, :string, default: 'Draft'
  end
end
