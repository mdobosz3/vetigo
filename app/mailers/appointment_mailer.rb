class AppointmentMailer < ApplicationMailer
  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.appointment_mailer.appointment_confirmation.subject
  #
  def appointment_confirmation
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
