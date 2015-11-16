class CreateEngagements < ActiveRecord::Migration
  def change
    create_table :engagements do |t|
      t.references :opportunity, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.string :status, default: 'pending'

      t.timestamps null: false
    end
  end
end
