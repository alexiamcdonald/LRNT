class AddLocation < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.string :area
      t.string :country

      t.timestamps null: false
    end
  end
end
