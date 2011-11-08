class Group < ActiveRecord::Base
  has_many :actors
  has_many :documents

  validates :title, :presence => true
  validates :title, :length => {:maximum => 200},
                    :uniqueness => true, :allow_blank => true

  before_destroy :can_be_destroyed_when_there_are_not_actors_and_documents

  def to_s
    title.to_s
  end
protected
  def can_be_destroyed_when_there_are_not_actors_and_documents
    actors.empty? && documents.empty?
  end
end
