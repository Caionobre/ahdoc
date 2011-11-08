class CreateBasicFlows < ActiveRecord::Migration
  def self.up
    create_table :basic_flows do |t|
      t.string :flow
      t.integer :order
      t.references :document

      t.timestamps
    end
  end

  def self.down
    drop_table :basic_flows
  end
end
