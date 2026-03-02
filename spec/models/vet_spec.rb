require 'rails_helper'

RSpec.describe Vet, type: :model do
  it "is valid with valid attributes" do
    vet = build(:vet)
    expect(vet).to be_valid
  end

  it "is not valid without a first_name" do
    vet = build(:vet, first_name: nil)
    expect(vet).not_to be_valid
  end

  it "is not valid without a last_name" do
    vet = build(:vet, last_name: nil)
    expect(vet).not_to be_valid
  end

  it "is not valid without a specialization" do
    vet = build(:vet, specialization: nil)
    expect(vet).not_to be_valid
  end

  it "is not valid without a clinic" do
    vet = build(:vet, clinic: nil)
    expect(vet).not_to be_valid
  end
end
