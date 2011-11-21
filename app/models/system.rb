class System < ActiveRecord::Base
  has_many :groups

  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:allow_blank => true}
  validates :version, :length => {:maximum => 25, :allow_blank => true}

  before_destroy :can_be_destroyed_when_there_are_not_groups

  def to_s
    name
  end
protected
  def can_be_destroyed_when_there_are_not_groups
    groups.empty?
  end
end
