class Constant::Field::StorageType < EnumerateIt::Base
  associate_values :primary_key => 1,
                   :foreign_key => 2,
                   :char        => 3,
                   :varchar     => 4,
                   :integer     => 5,
                   :double      => 6,
                   :decimal     => 7,
                   :numeric     => 8,
                   :date        => 9,
                   :datetime    => 10,
                   :time        => 11,
                   :timestamp   => 12
  
end
