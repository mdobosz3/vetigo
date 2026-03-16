class Pet < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true

  def name_with_species
    "#{name} (#{species})"
  end
end
