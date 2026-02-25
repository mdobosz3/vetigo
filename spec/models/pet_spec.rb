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
end
