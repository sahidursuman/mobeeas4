class CreateEnquiries < ActiveRecord::Migration
  def change
    create_table :enquiries do |t|
      t.string :enquiry_type
      t.string :name
      t.string :email
      t.string :phone
      t.string :company
      t.text :message

      t.timestamps null: false
    end
  end
end
