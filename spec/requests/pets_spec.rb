require 'rails_helper'

RSpec.describe "Pets", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let!(:pet) { create(:pet, user: user) }
  let!(:other_pet) { create(:pet, user: other_user) }

  before do
    sign_in user
  end

  describe "GET /pets (index)" do
    it "displays only the logged-in user's pets with their species" do
      get pets_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(pet.name)
      expect(response.body).to include("(#{pet.species})")
      expect(response.body).not_to include(other_pet.name)
    end
  end

  describe "GET /pets/new" do
    it "returns http success" do
      get new_pet_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /pets" do
    it "creates a new pet for the logged-in user" do
      expect {
        post pets_path, params: { pet: { name: "Reksio", species: "Pies", breed: "Kundel", age: 3 } }
      }.to change(user.pets, :count).by(1)

      expect(response).to redirect_to(pets_path)
    end
  end

  describe "GET /pets/:id/edit" do
    it "returns http success for the owner" do
      get edit_pet_path(pet)
      expect(response).to have_http_status(:success)
    end

    it "returns a 404 Not Found status when trying to edit someone else's pet" do
      get edit_pet_path(other_pet)
      expect(response).to have_http_status(:not_found)
    end
  end

  describe "PATCH /pets/:id" do
    it "updates the pet for the owner" do
      patch pet_path(pet), params: { pet: { name: "Nowe Imię" } }

      expect(response).to redirect_to(pets_path)
      expect(pet.reload.name).to eq("Nowe Imię")
    end

    it "returns a 404 Not Found status when trying to update someone else's pet" do
      patch pet_path(other_pet), params: { pet: { name: "Zhakowane Imię" } }

      expect(response).to have_http_status(:not_found)
    end
  end
end
