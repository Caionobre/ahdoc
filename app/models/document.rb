class Document < ActiveRecord::Base
  DEPENDENCIES = [:preconditions, :basic_flows, :posconditions, :prototypes, :alternative_flows]

  belongs_to :group
  belongs_to :actor
  DEPENDENCIES.each do |dependency|
    has_many dependency
  end
  has_and_belongs_to_many :tables

  validates :actor, :group, :title, :presence => true
  validates :title, :uniqueness => {:scope => :group_id},
                    :allow_blank => true

  before_destroy :can_be_destroyed_when_there_are_not_dependencies
  before_destroy :destroyed_when_there_are_tables

  def to_s
    title.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_dependencies
    DEPENDENCIES.all?{|dependency| send(dependency).empty?}
  end

  def destroyed_when_there_are_tables
    table_ids = []
    save false
  end
end