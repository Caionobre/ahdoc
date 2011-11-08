class BasicFlow < ActiveRecord::Base
  belongs_to :document
  validates :flow, :document, :order, :presence => true
  validates :flow, :length => {:maximum => 255},
                    :uniqueness => {:scope => :document_id},
                    :allow_blank => true
                    
  validates :order, :numericality => true,
                    :uniqueness => {:scope => :document_id},
                    :allow_blank => true

  def to_s
    flow.to_s
  end
end