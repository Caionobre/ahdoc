class System < ActiveRecord::Base
  has_many :databases
  has_many :groups

  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:allow_blank => true}
  validates :version, :length => {:maximum => 25, :allow_blank => true}

  before_destroy :can_be_destroyed_when_there_are_not_groups
  before_destroy :can_be_destroyed_when_there_are_not_databases

  def to_s
    name
  end
protected
  def can_be_destroyed_when_there_are_not_groups
    groups.empty?
  end

  def can_be_destroyed_when_there_are_not_databases
    databases.empty?
  end
end