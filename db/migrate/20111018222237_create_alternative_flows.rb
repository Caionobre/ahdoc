class CreateAlternativeFlows < ActiveRecord::Migration
  def self.up
    create_table :alternative_flows do |t|
      t.references :document
      t.string :title
      t.integer :order

      t.timestamps
    end
  end

  def self.down
    drop_table :alternative_flows
  end
end
