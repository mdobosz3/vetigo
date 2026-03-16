class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form_variables, only: [ :new, :create ]

  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.status = "scheduled"

    if @appointment.save
      # ensure_owner_exists_for_clinic
      redirect_to root_path, notice: "Wizyta została pomyślnie umówiona!"
    else
      render :new, status: :unprocessable_content
    end
  end

  def index
    @appointments = current_user.appointments.order(scheduled_at: :asc)
  end

  private

  def appointment_params
    params.require(:appointment).permit(:pet_id, :vet_id, :reason, :scheduled_at)
  end

  def set_form_variables
    @clinic = Clinic.find(params[:clinic_id])
    @vets = @clinic.vets

    if current_user.admin?
      @pets = Pet.all
    else
      @pets = current_user.pets
    end
  end

  # def ensure_owner_exists_for_clinic
  #   Owner.find_or_create_by(clinic_id: @clinic.id, email: current_user.email) do |owner|
  #     owner.first_name = "Klient"
  #     owner.last_name = current_user.email.split("@").first.capitalize
  #     owner.phone = "Brak"
  #   end
  # end
end
