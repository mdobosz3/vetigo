class AppointmentMailer < ApplicationMailer
  default from: "notifications@vetigo.pl"

  def appointment_confirmation
    @appointment = params[:appointment]
    @pet = @appointment.pet
    @owner = @pet.user

    mail(
      to: @owner.email,
      subject: "Potwierdzenie wizyty: #{@pet.name_with_species}"
    )
  end
end
