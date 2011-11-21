class Database < ActiveRecord::Base
  belongs_to :system

  validates :system, :presence => true
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :system_id, :allow_blank => true}

  def to_s
    name.to_s
  end
end