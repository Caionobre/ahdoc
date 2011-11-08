class GroupsController < InheritedController

protected
  def up_path
    groups_path
  end
  
  helper_method :up_path
end
