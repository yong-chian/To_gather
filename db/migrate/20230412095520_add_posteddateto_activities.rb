class AddPosteddatetoActivities < ActiveRecord::Migration[7.0]
  def change
    add_column :activities, :posteddate, :string
  end
end
