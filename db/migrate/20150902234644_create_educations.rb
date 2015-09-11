class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.references :user, index: true, foreign_key: true
      t.string :institution
      t.string :course
      t.string :year_completed

      t.timestamps null: false
    end
  end
end
