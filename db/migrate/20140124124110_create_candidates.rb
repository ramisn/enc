class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :sex
      t.date :dob
      t.string :addrs
      t.string :email
      t.integer :mobile

      t.timestamps
    end
  end
end
