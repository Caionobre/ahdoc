class CreatePosconditions < ActiveRecord::Migration
  def self.up
    create_table :posconditions do |t|
      t.string :flow
      t.integer :order
      t.references :document

      t.timestamps
    end
  end

  def self.down
    drop_table :posconditions
  end
end
