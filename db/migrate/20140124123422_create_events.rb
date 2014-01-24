class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :venue
      t.string :category

      t.timestamps
    end
  end
end
