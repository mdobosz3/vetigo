class Clinic < ApplicationRecord
  has_many :owners, dependent: :destroy
end
