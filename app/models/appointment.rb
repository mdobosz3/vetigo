class Appointment < ApplicationRecord
  belongs_to :pet
  belongs_to :vet

  validates :reason, presence: true
  validates :scheduled_at, presence: true

  validates :status, presence: true, inclusion: { in: %w[scheduled completed cancelled] }

  validate :scheduled_at_cannot_be_in_the_past

  private

  def scheduled_at_cannot_be_in_the_past
    if scheduled_at.present? && scheduled_at < Time.current
      errors.add(:scheduled_at, "can't be in the past")
    end
  end
end
