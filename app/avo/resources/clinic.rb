class Avo::Resources::Clinic < Avo::BaseResource
  self.title = :name
  self.includes = []

  self.index_query = -> do
    if current_user.admin?
      query
    elsif current_user.vet.present?
      query.where(id: current_user.vet.clinic_id)
    else
      query.none
    end
  end

  def fields
    field :id, as: :id
    field :name, as: :text
    field :address, as: :text
    field :city, as: :text

    field :owners, as: :has_many
    field :vets, as: :has_many
  end
end
