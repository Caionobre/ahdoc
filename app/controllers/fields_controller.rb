class FieldsController < InheritedController
  belongs_to :table
protected
  def up_path
    database_tables_path parent.database
  end
  
  helper_method :up_path
end
