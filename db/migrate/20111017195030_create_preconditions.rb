class CreatePreconditions < ActiveRecord::Migration
  def self.up
    create_table :preconditions do |t|
      t.string :flow
      t.integer :order
      t.references :document

      t.timestamps
    end
  end

  def self.down
    drop_table :preconditions
  end
end
