class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet
  has_one :medical_record, dependent: :destroy

  validates :reason, presence: true
  validates :scheduled_at, presence: true

  validates :status, presence: true, inclusion: { in: %w[scheduled completed cancelled] }

  validate :scheduled_at_cannot_be_in_the_past, on: :create

  def display_name
    "#{scheduled_at.strftime("%Y-%m-%d %H:%M")} | #{pet.name} (Vet: #{vet.full_name})"
  end

  private

  def scheduled_at_cannot_be_in_the_past
    if scheduled_at.present? && scheduled_at < Time.current
      errors.add(:scheduled_at, "can't be in the past")
    end
  end
end
