class PosconditionsController < InheritedController
  belongs_to :document

protected
  def up_path
    group_documents_path parent.group
  end
  
  helper_method :up_path
end
