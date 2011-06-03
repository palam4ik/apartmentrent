class AddDescription < ActiveRecord::Migration
  def self.up
    rename_column :apartments, :detailed_description, :en_description
    add_column :apartments, :ru_description, :text
    add_column :apartments, :ro_description, :text
  end

  def self.down
    rename_column :apartments, :en_description, :detailed_description
    remove_column :apartments, :ru_description
    remove_column :apartments, :ro_description
  end
end
