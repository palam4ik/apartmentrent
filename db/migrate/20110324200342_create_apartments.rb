class CreateApartments < ActiveRecord::Migration
  def self.up
    create_table :apartments do |t|
      t.integer :rooms, :default => 1
      t.boolean :internet, :default => 1
      t.boolean :washing_machine, :default => 1
      t.integer :num_persons, :default => 1
      t.integer :price
      t.boolean :conditioner, :default => 1
      t.boolean :tv, :default => 1
      t.boolean :balcony, :default => 1
      t.string :ru_address
      t.string :ro_address
      t.string :en_address
      t.
      t.timestamps
    end
  end

  def self.down
    drop_table :apartments
  end
end
