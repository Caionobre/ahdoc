class CreateDatabases < ActiveRecord::Migration
  def self.up
    create_table :databases do |t|
      t.references :system
      t.string :name
      t.text :description
      t.string :engineer
      t.string :version

      t.timestamps
    end
  end

  def self.down
    drop_table :databases
  end
end
