require 'rails_helper'

RSpec.describe CreateAppointmentService do
  let(:user) { create(:user) }
  let(:clinic) { create(:clinic) }
  let(:pet) { create(:pet, user: user) }
  let(:vet) { create(:vet, clinic: clinic) }

  let(:valid_params) do
    { pet_id: pet.id, vet_id: vet.id, scheduled_at: 1.day.from_now, reason: "Ból łapy" }
  end

  let(:invalid_params) do
    { pet_id: nil, vet_id: vet.id, scheduled_at: 1.day.from_now, reason: "" }
  end

  describe "#call" do
    context "when parameters are valid" do
      let(:service) { described_class.new(appointment_params: valid_params, user: user, clinic_id: clinic.id) }

      it "creates a new appointment" do
        expect { service.call }.to change(Appointment, :count).by(1)
      end

      it "sets status to scheduled" do
        service.call
        expect(service.appointment.status).to eq("scheduled")
      end

      it "creates an owner for the clinic" do
        expect { service.call }.to change(Owner, :count).by(1)
      end

      it "returns true" do
        expect(service.call).to be true
      end
    end

    context "when parameters are invalid" do
      let(:service) { described_class.new(appointment_params: invalid_params, user: user, clinic_id: clinic.id) }

      it "does not create an appointment" do
        expect { service.call }.not_to change(Appointment, :count)
      end

      it "returns false" do
        expect(service.call).to be false
      end
    end
  end
end
