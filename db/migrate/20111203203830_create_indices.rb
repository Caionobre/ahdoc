class CreateIndices < ActiveRecord::Migration
  def self.up
    create_table :indices do |t|
      t.string :name
      t.text :description
      t.references :table

      t.timestamps
    end
  end

  def self.down
    drop_table :indices
  end
end
