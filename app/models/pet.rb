class Pet < ApplicationRecord
  validates :name, presence: true
  validates :species, presence: true
end
