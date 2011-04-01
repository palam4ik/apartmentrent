class AddSpecialToApartment < ActiveRecord::Migration
  def self.up
    add_column :apartments, :special, :boolean, :default => 0
  end

  def self.down
    remove_column :apartments, :special
  end
end
