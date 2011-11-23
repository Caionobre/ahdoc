class CreateFields < ActiveRecord::Migration
  def self.up
    create_table :fields do |t|
      t.references :table
      t.string :name
      t.integer :storage_type
      t.boolean :nullable,      :default => true
      t.boolean :auto_increment
      t.string :default
      t.integer :length
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :fields
  end
end
