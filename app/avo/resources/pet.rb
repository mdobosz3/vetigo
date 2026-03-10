class Avo::Resources::Pet < Avo::BaseResource
  self.index_query = -> do
    if current_user.admin?
      query
    elsif current_user.vet.present?
      query.joins(:owner).where(owners: { clinic_id: current_user.vet.clinic_id })
    else
      query.none
    end
  end

  self.title = :name_with_species

  def fields
    field :id, as: :id
    field :name, as: :text
    field :species, as: :text
    field :breed, as: :text
    field :age, as: :number
    field :owner, as: :belongs_to
    field :appointments, as: :has_many
    field :medical_records, as: :has_many
  end
end
