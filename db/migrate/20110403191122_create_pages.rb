class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.string :url
      t.string :ro_title
      t.string :ru_title
      t.string :en_title
      t.text :ru_body
      t.text :en_body
      t.text :ro_body

      t.timestamps
    end
  end

  def self.down
    drop_table :pages
  end
end
