class AppointmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_form_variables, only: [ :new, :create ]

  def index
    all_appointments = current_user.appointments.includes(:pet, vet: :clinic)

    @upcoming_appointments = all_appointments.where("scheduled_at >= ?", Time.current).order(scheduled_at: :asc)
    @past_appointments = all_appointments.where("scheduled_at < ?", Time.current).order(scheduled_at: :desc)
  end
  def new
    @appointment = Appointment.new
  end

  def show
    @appointment = current_user.appointments.find(params[:id])
  end

  def create
    service = CreateAppointmentService.new(
      appointment_params: appointment_params,
      user: current_user,
      clinic_id: params[:clinic_id]
    )

    if service.call
      redirect_to appointments_path, notice: "Wizyta została umówiona! Wysłaliśmy e-mail z potwierdzeniem."
    else
      @appointment = service.appointment
      render :new, status: :unprocessable_content
    end
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
end
