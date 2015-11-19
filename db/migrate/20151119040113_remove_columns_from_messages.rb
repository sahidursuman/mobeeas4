class RemoveColumnsFromMessages < ActiveRecord::Migration
  def change
    remove_column :messages, :from, :string
    remove_column :messages, :to, :string
  end
end
