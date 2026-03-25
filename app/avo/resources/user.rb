class Avo::Resources::User < Avo::BaseResource
  self.title = :full_name
  self.includes = []

  def fields
    field :id, as: :id
    field :email, as: :text
    field :first_name, as: :text
    field :last_name, as: :text
    field :phone, as: :text
    field :pets, as: :has_many
    field :appointments, as: :has_many, through: :pets
    field :vet, as: :has_one
  end
end
