class CreateSkillVerifications < ActiveRecord::Migration
  def change
    create_table :skill_verifications do |t|
      t.references :user, index: true, foreign_key: true
      t.string :referree_name
      t.string :referree_email
      t.string :referree_phone
      t.string :referree_relationship
      t.string :time_known
      t.integer :work_ethic
      t.integer :communication
      t.integer :presentation
      t.text :accomplishments

      t.timestamps null: false
    end
  end
end
