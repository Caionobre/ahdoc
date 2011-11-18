class System < ActiveRecord::Base
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:allow_blank => true}
  validates :version, :length => {:maximum => 25, :allow_blank => true}

  def to_s
    name
  end
end
