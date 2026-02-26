require 'rails_helper'

RSpec.describe Owner, type: :model do
  it "is valid with valid attributes" do
    owner = build(:owner)
    expect(owner).to be_valid
  end

  it "is not valid without a first_name" do
    owner = build(:owner, first_name: nil)
    expect(owner).not_to be_valid
  end
end
