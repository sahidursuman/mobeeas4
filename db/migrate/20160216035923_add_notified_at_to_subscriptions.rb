class AddNotifiedAtToSubscriptions < ActiveRecord::Migration
  def change
    add_column :subscriptions, :notified_at, :datetime
  end
end
