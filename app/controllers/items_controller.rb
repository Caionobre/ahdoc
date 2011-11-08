class ItemsController < InheritedController
  belongs_to :alternative_flow
protected  
  def up_path
    document_alternative_flows_path parent.document
  end
  
  helper_method :up_path
end
