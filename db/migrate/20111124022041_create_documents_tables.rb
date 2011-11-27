class CreateDocumentsTables < ActiveRecord::Migration
  def self.up
    create_table :documents_tables, :id => false do |t|
      t.integer :document_id
      t.integer :table_id
    end
  end

  def self.down
    drop_table :documents_tables
  end
end
