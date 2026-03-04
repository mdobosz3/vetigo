require 'rails_helper'

RSpec.describe User, type: :model do
  describe "user creation" do
    it "is valid with valid attributes (email and password)" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "is not valid without an email" do
      user = build(:user, email: nil)
      expect(user).to_not be_valid
    end
  end

  describe "role-based access (admin flag)" do
    it "defaults admin to false (regular user)" do
      user = build(:user)
      expect(user.admin).to be(false)
    end

    it "allows creating an administrator account" do
      user = build(:user, admin: true)
      expect(user.admin).to be(true)
    end
  end

  describe "database associations" do
    it "has one vet profile (has_one :vet)" do
      association = described_class.reflect_on_association(:vet)
      expect(association.macro).to eq :has_one
    end
  end
end
