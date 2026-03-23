class Pet < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true

  def name_with_species
    "#{name} (#{species})"
  end

  def age
    return 0 if birth_date.blank?
    today = Date.current
    calculated_age = today.year - birth_date.year
    calculated_age -= 1 if today < birth_date + calculated_age.years
    calculated_age
  end
end
