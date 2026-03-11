class Clinic < ApplicationRecord
  has_many :owners, dependent: :destroy
  has_many :vets, dependent: :destroy

  validates :address, :city, presence: true

  geocoded_by :full_address
  after_validation :geocode, if: ->(obj) { obj.address_changed? || obj.city_changed? }

  def full_address
    "#{address}, #{city}"
  end
end
