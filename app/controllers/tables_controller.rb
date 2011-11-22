class TablesController < InheritedController
  belongs_to :database
protected
  def up_path
    system_databases_path parent.system
  end
  
  helper_method :up_path
end
