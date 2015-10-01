class CreateAgreements < ActiveRecord::Migration
  def change
    create_table :agreements do |t|
      t.references :user, index: true, foreign_key: true
      t.boolean :ethics, default: false
      t.boolean :code_of_conduct, default: false
      t.boolean :terms, default: false

      t.timestamps null: false
    end
  end
end
