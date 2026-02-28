class Avo::Resources::Owner < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }
  self.title = :last_name
  self.includes = []

  def fields
    field :id, as: :id
    field :first_name, as: :text
    field :last_name, as: :text
    field :email, as: :text
    field :phone, as: :text
    field :clinic, as: :belongs_to
    field :pets, as: :has_many
  end
end
