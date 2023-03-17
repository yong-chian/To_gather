class AddNamePhoneNoHomeAdressOccupationStatusInterestToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone_no, :integer
    add_column :users, :home_address, :string
    add_column :users, :occupation_status, :string
    add_column :users, :interest, :string
  end
end
