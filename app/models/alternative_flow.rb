class AlternativeFlow < ActiveRecord::Base
  belongs_to :document
  has_many :items, :class_name => "AlternativeFlow::Item"
  
  validates :title, :order, :presence => true
  validates :title, :length => {:maximum => 255},
                    :uniqueness => {:scope => :document_id},
                    :allow_blank => true
  validates :order, :numericality => true,
                    :uniqueness => {:scope => :document_id},
                    :allow_blank => true

  before_destroy :can_be_destroyed_when_there_are_not_items

  def to_s
    title.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_items
    items.empty?
  end
end
