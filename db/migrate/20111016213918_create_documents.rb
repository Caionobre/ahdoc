class CreateDocuments < ActiveRecord::Migration
  def self.up
    create_table :documents do |t|
      t.string :title
      t.text :description
      t.references :actor
      t.references :group
      t.string :use_case
      t.string :sequence_diagram
      t.string :relational_diagram
      t.string :note

      t.timestamps
    end
  end

  def self.down
    drop_table :documents
  end
end
