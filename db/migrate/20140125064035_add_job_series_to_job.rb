class AddJobSeriesToJob < ActiveRecord::Migration
  def change
    add_column :jobs, :job_series_id, :integer
    add_index :jobs, :job_series_id
  end
end
