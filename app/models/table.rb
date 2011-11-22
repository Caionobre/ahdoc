class Table < ActiveRecord::Base
  belongs_to :database

  validates :database, :presence => true
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :database_id, :allow_blank => true}

  def to_s
    name
  end
end