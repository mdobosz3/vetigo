class Avo::Filters::AppointmentStatus < Avo::Filters::BooleanFilter
  self.name = "Appointment status"

  def apply(request, query, value)
    return query if value.blank?
    if value.is_a?(Hash)
      selected_statuses = value.select { |k, v| v }.keys
      return query if selected_statuses.empty?
      query.where(status: selected_statuses)
    else
      query.where(status: value.to_s)
    end
  end

  def options
    {
      scheduled: "Scheduled",
      completed: "Completed",
      cancelled: "Cancelled"
    }
  end
end
