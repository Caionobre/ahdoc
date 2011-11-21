class Group < ActiveRecord::Base
  belongs_to :system
  has_many :actors
  has_many :documents

  validates :system, :presence => true
  validates :title, :presence => true,
                    :length => {:maximum => 200, :allow_blank => true},
                    :uniqueness => {:scope => :system_id, :allow_blank => true}

  before_destroy :can_be_destroyed_when_there_are_not_actors_and_documents

  def to_s
    title.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_actors_and_documents
    actors.empty? && documents.empty?
  end
end
