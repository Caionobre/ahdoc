class Table < ActiveRecord::Base
  belongs_to :database
  has_many :fields

  validates :database, :presence => true
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :database_id, :allow_blank => true}

  before_destroy :can_be_destroyed_when_there_are_not_fields

  def to_s
    name
  end
protected
  def can_be_destroyed_when_there_are_not_fields
    fields.empty?
  end
end