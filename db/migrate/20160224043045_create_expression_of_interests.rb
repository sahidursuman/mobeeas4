class CreateExpressionOfInterests < ActiveRecord::Migration
  def change
    create_table :expression_of_interests do |t|
      t.references :sponsor, index: true, foreign_key: true
      t.references :opportunity, index: true, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps null: false
    end
  end
end
