class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :title
      t.string :description
      t.datetime :starttime
      t.datetime :endtime
      t.boolean :all_day

      t.timestamps
    end
  end
end
