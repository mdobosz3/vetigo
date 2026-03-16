class Avo::Resources::Owner < Avo::BaseResource
  self.title = :last_name
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
    field :email, as: :text
    field :phone, as: :text
    field :clinic, as: :belongs_to
  end
end
