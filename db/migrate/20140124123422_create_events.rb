class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.string :venue
      t.integer :category_id

      t.timestamps
    end
  end
end
