class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.boolean :status, :default => true

      t.timestamps
    end
  end
end
