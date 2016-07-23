class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.integer :user_id
      t.integer :location_id
      t.text :bio
      t.integer :learn_one
      t.integer :learn_two
      t.integer :learn_three
      t.integer :teach_one
      t.integer :teach_two
      t.integer :teach_three

      t.timestamps null: false
    end
  end
end
