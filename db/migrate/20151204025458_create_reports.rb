class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.references :opportunity, index: true, foreign_key: true
      t.string :type
      t.string :relevant_knowledge
      t.text :relevant_knowledge_comment
      t.string :punctual
      t.text :punctual_comment
      t.string :communication
      t.text :communication_comment
      t.string :enthusiasm
      t.text :enthusiasm_comment
      t.string :professionalism
      t.text :professionalism_comment
      t.text :stength
      t.text :further_dev
      t.text :general_comments

      t.timestamps null: false
    end
  end
end
