require 'rails_helper'

RSpec.describe Clinic, type: :model do
  it "is valid with valid attributes" do
    clinic = build(:clinic)
    expect(clinic).to be_valid
  end
end
