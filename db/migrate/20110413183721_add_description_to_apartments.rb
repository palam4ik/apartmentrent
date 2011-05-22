class AddDescriptionToApartments < ActiveRecord::Migration
  def self.up
    add_column :apartments, :description, :text
  end

  def self.down
    remove_column :apartments, :description
  end
end
