class DatabasesController < InheritedController
  belongs_to :system
protected
  def up_path
    systems_path
  end
  
  helper_method :up_path
end
