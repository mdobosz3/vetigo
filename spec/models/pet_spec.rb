require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "is valid with valid attributes" do
    pet = build(:pet)
    expect(pet).to be_valid
  end

  it "is not valid without a name" do
    pet = build(:pet, name: nil)
    expect(pet).not_to be_valid
  end

  it "is not valid without an owner" do
    pet = build(:pet, owner: nil)
    expect(pet).not_to be_valid
  end

  describe "#name_with_species" do
    it "returns the name and species formatted correctly" do
      pet = build(:pet, name: "Riley", species: "Dog")
      expect(pet.name_with_species).to eq("Riley (Dog)")
    end
  end
end
