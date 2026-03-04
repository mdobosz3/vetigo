class Avo::Resources::Vet < Avo::BaseResource
  self.title = :full_name
  self.includes = []

  self.index_query = -> do
    if current_user.admin?
      query
    elsif current_user.vet.present?
      query.where(clinic_id: current_user.vet.clinic_id)
    else
      query.none
    end
  end

  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :specialization, as: :text
    field :clinic_id, as: :number

    field :clinic, as: :belongs_to
    field :appointments, as: :has_many
  end
end
