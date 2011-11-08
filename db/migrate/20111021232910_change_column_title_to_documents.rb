class ChangeColumnTitleToDocuments < ActiveRecord::Migration
  def self.up
    change_column :documents, :title, :string
  end

  def self.down
    change_column :documents, :title, :text
  end
end
