class Index < ActiveRecord::Base
  belongs_to :table
  validates :name, :table, :presence => true
  validates :name, :length => {:maximum => 255, :allow_blank => true},
            :uniqueness => {:scope => :table_id, :allow_blank => true}
end
