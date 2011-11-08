class CreatePrototypes < ActiveRecord::Migration
  def self.up
    create_table :prototypes do |t|
      t.references :document
      t.string :description
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :prototypes
  end
end
