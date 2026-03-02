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

  it "is not valid with an incorrect status" do
    appointment = build(:appointment, status: "in_progress")
    expect(appointment).not_to be_valid
  end

  it "is not valid without a reason" do
    appointment = build(:appointment, reason: nil)
    expect(appointment).not_to be_valid
  end
end
