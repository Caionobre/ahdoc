class Poscondition < ActiveRecord::Base
  belongs_to :document
  validates :flow, :order, :document, :presence => true
  validates :flow, :length => {:maximum => 255},
                   :uniqueness => {:scope => :document_id},
                   :allow_blank => true
                   
  validates :order, :uniqueness => {:scope => :document_id},
                    :numericality => true,
                    :allow_blank => true

  def to_s
    flow.to_s
  end
end