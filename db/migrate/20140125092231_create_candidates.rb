class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :gender
      t.date :dob
      t.string :education
      t.string :website
      t.string :address
      t.string :address1
      t.string :city
      t.string :state
      t.integer :zip
      t.string :home_phone
      t.string :mobile
      t.string :language
      t.string :cv

      t.timestamps
    end
  end
end
