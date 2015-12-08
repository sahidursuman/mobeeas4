class FixColumnNames < ActiveRecord::Migration
  def change
    change_table :engagements do |t|
      t.rename :progress_report, :progress_report_id
      t.rename :completion_report, :completion_report_id
    end
  end
end
