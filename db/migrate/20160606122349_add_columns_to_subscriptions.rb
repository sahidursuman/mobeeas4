class AddColumnsToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :manual_receipt, :boolean, default: false
    add_column :subscriptions, :notes, :text
  end
end
