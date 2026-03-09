class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy
  has_many :medical_records, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true
end
