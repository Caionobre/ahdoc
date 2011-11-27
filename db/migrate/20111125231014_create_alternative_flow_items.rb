class CreateAlternativeFlowItems < ActiveRecord::Migration
  def self.up
    create_table :alternative_flow_items do |t|
      t.references :alternative_flow
      t.string :flow
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :alternative_flow_items
  end
end
