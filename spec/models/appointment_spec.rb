require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it "is valid with valid attributes (future date and correct status)" do
    appointment = build(:appointment)
    expect(appointment).to be_valid
  end

  it "is not valid if scheduled in the past" do
    appointment = build(:appointment, scheduled_at: 1.day.ago)
    expect(appointment).not_to be_valid
    expect(appointment.errors[:scheduled_at]).to include("can't be in the past")
  end

  it "is valid when updating an existing appointment with a past date" do
    appointment = create(:appointment, scheduled_at: 1.day.from_now)
    appointment.update_column(:scheduled_at, 1.day.ago)
    appointment.status = "completed"
    expect(appointment).to be_valid
  end

  it "is not valid with an incorrect status" do
    appointment = build(:appointment, status: "in_progress")
    expect(appointment).not_to be_valid
  end

  it "is not valid without a reason" do
    appointment = build(:appointment, reason: nil)
    expect(appointment).not_to be_valid
  end

  describe "#display_name" do
    it "returns formatted string with date, pet and vet" do
      pet = build(:pet, name: "Riley")
      vet = build(:vet, first_name: "Russ", last_name: "Fahey", specialization: "Dentist")

      appointment = build(:appointment,
        scheduled_at: Time.zone.parse("2026-03-04 06:31:00"),
        pet: pet,
        vet: vet
      )

      expected_name = "2026-03-04 06:31 | Riley (Vet: Russ Fahey (Dentist))"
      expect(appointment.display_name).to eq(expected_name)
    end
  end
end
