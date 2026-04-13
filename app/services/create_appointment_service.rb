class CreateAppointmentService
  attr_reader :appointment

  def initialize(appointment_params:, user:, clinic_id:)
    @appointment = Appointment.new(appointment_params)
    @appointment.status = "scheduled"

    @user = user
    @clinic_id = clinic_id
  end

  def call
    if @appointment.save
      ensure_owner_exists_for_clinic
      true
    else
      false
    end
  end

  private

  def ensure_owner_exists_for_clinic
    Owner.find_or_create_by(clinic_id: @clinic_id, email: @user.email) do |owner|
      owner.first_name = @user.first_name || "Klient"
      owner.last_name  = @user.last_name || @user.email.split("@").first.capitalize
      owner.phone      = @user.phone || "Brak numeru"
    end
  end

  def send_confirmation_email
    AppointmentMailer.with(appointment: @appointment).appointment_confirmation.deliver_later
  end
end
