class Prototype < ActiveRecord::Base

  belongs_to :document
  
  validates :description, :uniqueness => {:scope => :document_id},
                          :allow_blank => true,
                          :presence => true,
                          :length => {:maximum => 255}

  validates :link,        :presence => true,
                          :length => {:maximum => 255},
                          :allow_blank => true,
                          :uniqueness => true

  def to_s
    description.to_s
  end

end
