class CreateActivityInterests < ActiveRecord::Migration[7.0]
  def change
    create_table :activity_interests do |t|
      t.references :activity, null: false, foreign_key: true
      t.references :interest, null: false, foreign_key: true

      t.timestamps
    end
  end
end
