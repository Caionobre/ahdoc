class IndicesController < InheritedController
  belongs_to :table
protected
  def up_path
    table_indices_path parent.table
  end

  helper_method :up_path
end
