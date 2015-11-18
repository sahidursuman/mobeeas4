class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :user, index: true, foreign_key: true
      t.references :profile, index: true, foreign_key: true
      t.references :opportunity, index: true, foreign_key: true
      t.string :from
      t.string :to
      t.text :message_text
      t.string :status, default: 'unread'
      t.string :attachment

      t.timestamps null: false
    end
  end
end
