class CreateJobSeries < ActiveRecord::Migration
  def change
    create_table :job_series do |t|
      t.integer :frequency
      t.string :period
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day

      t.timestamps
    end
  end
end
