class AlternativeFlow::Item < ActiveRecord::Base
  belongs_to :alternative_flow

  validates :alternative_flow, :presence => true
  validates :flow, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :alternative_flow_id, :allow_blank => true}
  validates :order, :presence => true,
                    :numericality => {:allow_blank => true},
                    :uniqueness => {:scope => :alternative_flow_id, :allow_blank => true}

  def to_s
    flow.to_s
  end
end