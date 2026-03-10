require 'rails_helper'

RSpec.describe MedicalRecord, type: :model do
  describe "validations and associations" do
    it "is valid with valid attributes" do
      medical_record = build(:medical_record)
      expect(medical_record).to be_valid
    end

    it "is not valid without a pet" do
      medical_record = build(:medical_record, pet: nil)
      expect(medical_record).not_to be_valid
    end

    it "is not valid without an appointment" do
      medical_record = build(:medical_record, appointment: nil)
      expect(medical_record).not_to be_valid
    end
  end
end
