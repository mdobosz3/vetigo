class Pet < ApplicationRecord
  belongs_to :owner
  has_many :appointments, dependent: :destroy

  validates :name, presence: true
  validates :species, presence: true
end
