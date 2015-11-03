class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column :opportunities, :opportunity_status, :string, default: "draft"
  end
end
