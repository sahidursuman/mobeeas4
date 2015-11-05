class ChangeColumnType2 < ActiveRecord::Migration
  def change
    change_column :opportunities, :pay, :string
  end
end
