class Actor < ActiveRecord::Base
  belongs_to :group
  has_many :documents

  validates :group, :name, :presence => true
  validates :name, :length => {:maximum => 50},
                   :uniqueness => {:scope => :group_id},
                   :allow_blank => true

  before_destroy :can_be_destroyed_when_there_are_not_documents

  def to_s
    name.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_documents
    documents.empty?
  end
end
