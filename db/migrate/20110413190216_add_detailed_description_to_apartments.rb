class AddDetailedDescriptionToApartments < ActiveRecord::Migration
  def self.up
    add_column :apartments, :detailed_description, :text
  end

  def self.down
    remove_column :apartments, :detailed_description
  end
end
