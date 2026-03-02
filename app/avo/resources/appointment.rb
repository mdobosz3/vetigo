class Avo::Resources::Appointment < Avo::BaseResource
  self.title = :id
  self.includes = []

  def fields
    field :id, as: :id
    field :scheduled_at, as: :date_time
    field :reason, as: :textarea
    field :status, as: :select, options: { 'Scheduled': "scheduled", 'Completed': "completed", 'Cancelled': "cancelled" }

    field :pet, as: :belongs_to
    field :vet, as: :belongs_to
  end
end
