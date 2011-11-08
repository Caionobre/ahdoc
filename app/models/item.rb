class Item < ActiveRecord::Base
  belongs_to :alternative_flow
  validates :flow, :order, :presence => true
  validates :flow, :length => {:maximum => 255}, 
                   :uniqueness => {:scope => :alternative_flow_id},
                   :allow_blank => true
  validates :order, :numericality => true,
                   :uniqueness => {:scope => :alternative_flow_id},
                   :allow_blank => true

  def to_s
    flow.to_s
  end
end