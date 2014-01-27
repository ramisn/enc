class AddUserDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :last_name, :string
    add_column :users, :middle_initial, :string
    add_column :users, :social_security, :string
    add_column :users, :verify_social_security, :string
    add_column :users, :website, :string
    add_column :users, :address, :string
    add_column :users, :address1, :string
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :zip, :string
    add_column :users, :home_phone, :string
    add_column :users, :work_phone, :string
    add_column :users, :ext, :string
    add_column :users, :mobile, :string
    add_column :users, :fax, :string
    add_column :users, :available, :boolean
  end
end
