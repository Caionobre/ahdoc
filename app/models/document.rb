class Document < ActiveRecord::Base
  DEPENDENCIES = [:preconditions, :basic_flows, :posconditions, :prototypes, :alternative_flows]

  belongs_to :group
  belongs_to :actor
  DEPENDENCIES.each do |dependency|
    has_many dependency
  end

  validates :actor, :group, :title, :presence => true
  validates :title, :uniqueness => {:scope => :group_id},
                    :allow_blank => true

  before_destroy :can_be_destroyed_when_there_are_not_dependencies

  def to_s
    title.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_dependencies
    DEPENDENCIES.all?{|dependency| send(dependency).empty?}
  end
end