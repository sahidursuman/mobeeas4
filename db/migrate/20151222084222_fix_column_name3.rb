class FixColumnName3 < ActiveRecord::Migration
  def change
    rename_column :agreements, :terms, :candidate_terms
  end
end
