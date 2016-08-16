class PoolAnimal < ApplicationRecord
  belongs_to :animal
  belongs_to :pool
end
