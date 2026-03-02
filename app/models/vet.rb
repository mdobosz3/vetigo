class Vet < ApplicationRecord
  belongs_to :clinic
  has_many :appointments, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :specialization, presence: true

  def full_name
    "#{first_name} #{last_name} (#{specialization})"
  end
end
