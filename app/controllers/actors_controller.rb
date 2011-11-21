class ActorsController < InheritedController
  belongs_to :group
protected
  def up_path
    system_groups_path parent.system
  end
  
  helper_method :up_path
end