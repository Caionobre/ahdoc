class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.references :alternative_flow
      t.string :flow
      t.string :order

      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
