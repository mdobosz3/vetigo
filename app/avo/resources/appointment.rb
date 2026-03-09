class Avo::Resources::Appointment < Avo::BaseResource
  self.title = :id
  self.includes = []

  def filters
    filter Avo::Filters::AppointmentTimeframe
    filter Avo::Filters::AppointmentStatus
  end

  def actions
    action Avo::Actions::UpdateAppointmentStatus
  end

  self.index_query = -> do
    if current_user.admin?
      query.order(scheduled_at: :asc)
    elsif current_user.vet.present?
      query.where(vet_id: current_user.vet.id).order(scheduled_at: :asc)
    else
      query.none
    end
  end

  def fields
    field :id, as: :id
    field :scheduled_at, as: :date_time, sortable: true
    field :reason, as: :textarea
    field :status, as: :select, options: { 'Scheduled': "scheduled", 'Completed': "completed", 'Cancelled': "cancelled" }

    field :pet, as: :belongs_to
    field :vet, as: :belongs_to
  end
end
