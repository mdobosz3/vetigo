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
    pet = build(:pet, user: nil)
    expect(pet).not_to be_valid
  end

  describe "#name_with_species" do
    it "returns the name and species formatted correctly" do
      pet = build(:pet, name: "Riley", species: "Dog")
      expect(pet.name_with_species).to eq("Riley (Dog)")
    end
  end

  describe "#age" do
    it "calculates age correctly based on birth_date" do
      pet = build(:pet, birth_date: 3.years.ago.to_date)
      expect(pet.age).to eq(3)
    end

    it "returns 0 if birth_date is nil" do
      pet = build(:pet, birth_date: nil)
      expect(pet.age).to eq(0)
    end
  end
end
