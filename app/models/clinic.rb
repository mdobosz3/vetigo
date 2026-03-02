class Clinic < ApplicationRecord
  has_many :owners, dependent: :destroy
  has_many :vets, dependent: :destroy
end
