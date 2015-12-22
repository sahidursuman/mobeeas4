class AddColumnsToAgreements < ActiveRecord::Migration
  def change
    add_column :agreements, :host_terms, :boolean, default: false
    add_column :agreements, :sponsor_terms, :boolean, default: false
  end
end
