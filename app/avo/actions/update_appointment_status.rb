class Avo::Actions::UpdateAppointmentStatus < Avo::BaseAction
  self.name = "Update Status"
  self.message = "Are you sure you want to update the status for selected appointments?"

  def fields
    field :status, as: :select, options: {
      scheduled: "Scheduled",
      completed: "Completed",
      cancelled: "Cancelled"
    }, required: true
  end

  def handle(query:, fields:, **args)
    new_status = fields[:status].to_s.downcase
    query.each do |appointment|
      appointment.update!(status: new_status)
    end

    succeed "Appointments successfully updated!"
  end
end
