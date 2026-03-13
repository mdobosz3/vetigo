require 'rails_helper'

RSpec.describe "Appointments", type: :request do
  include Devise::Test::IntegrationHelpers

  let(:user) { create(:user) }
  let(:clinic) { create(:clinic) }

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

  # describe "GET /appointments" do
  #  it "returns http success" do
  #    get appointments_path
  #    expect(response).to have_http_status(:success)
  #  end
  # end
end
