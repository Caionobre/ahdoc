class Database < ActiveRecord::Base
  belongs_to :system
  has_many :tables

  validates :system, :presence => true
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :system_id, :allow_blank => true}

  before_destroy :can_be_destroyed_when_there_are_not_tables

  def to_s
    name.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_tables
    tables.empty?
  end
end