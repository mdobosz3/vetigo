require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let(:other_user) { create(:user) }
  let(:clinic) { create(:clinic) }
  let(:vet) { create(:vet, clinic: clinic) }
  let(:pet) { create(:pet, user: user) }
  let(:other_pet) { create(:pet, user: other_user) }
  let!(:user_appointment) { create(:appointment, pet: pet, vet: vet, scheduled_at: 1.day.from_now) }
  let!(:other_appointment) { create(:appointment, pet: other_pet, vet: vet, scheduled_at: 2.days.from_now) }

  before do
    sign_in user
  end

  describe "GET /appointments/new" do
    it "returns http success" do
      get new_appointment_path(clinic_id: clinic.id)

      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /appointments" do
    it "renders new form on validation failure" do
      post appointments_path, params: { clinic_id: clinic.id, appointment: { reason: "", scheduled_at: "" } }

      expect(response).to have_http_status(:unprocessable_content)
    end
  end

  describe "GET /appointments (index)" do
    it "returns a successful response and displays only the logged-in user's appointments" do
      get appointments_path

      expect(response).to have_http_status(:success)
      expect(response.body).to include(pet.name)
      expect(response.body).to include("(#{pet.species})")
      expect(response.body).not_to include(other_pet.name)
    end
  end

  describe "GET /appointments/:id (show)" do
    it "renders the appointment details for the owner" do
      get appointment_path(user_appointment)

      expect(response).to have_http_status(:success)
      expect(response.body).to include(pet.name)
      expect(response.body).to include(vet.first_name)
      expect(response.body).to include(vet.last_name)
    end

    it "returns a 404 Not Found status when trying to access someone else's appointment" do
      get appointment_path(other_appointment)

      expect(response).to have_http_status(:not_found)
    end
  end
end
