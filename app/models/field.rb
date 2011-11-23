class Field < ActiveRecord::Base
  belongs_to :table

  has_enumeration_for :storage_type, :with => Constant::Field::StorageType, :create_helpers => true

  validates :table, :presence => true
  validates :name, :presence => true,
                   :length => {:maximum => 255, :allow_blank => true},
                   :uniqueness => {:scope => :table_id, :allow_blank => true}
  validates :storage_type, :presence => true
end
