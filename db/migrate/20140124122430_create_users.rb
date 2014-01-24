class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :sex
      t.date :dob
      t.string :address
      t.integer :mobile

      t.timestamps
    end
  end
end
