class AddPictureToSetting < ActiveRecord::Migration
  def change
    add_column :settings, :picture, :string
  end
end
