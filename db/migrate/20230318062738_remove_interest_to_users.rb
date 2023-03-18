class RemoveInterestToUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :interest, :string
  end
end
