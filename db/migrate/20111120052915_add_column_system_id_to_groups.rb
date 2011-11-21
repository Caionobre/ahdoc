class AddColumnSystemIdToGroups < ActiveRecord::Migration
  def self.up
    add_column :groups, :system_id, :integer
  end

  def self.down
    remove_column :groups, :system_id
  end
end
