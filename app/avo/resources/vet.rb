class Avo::Resources::Vet < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }
  self.title = :full_name

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
