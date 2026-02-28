class Avo::Resources::Clinic < Avo::BaseResource
  # self.includes = []
  # self.attachments = []
  # self.search = {
  #   query: -> { query.ransack(id_eq: q, m: "or").result(distinct: false) }
  # }
  self.title = :name # Pokazuje nazwę kliniki jako główny tytuł w panelu
  self.includes = []

  def fields
    field :id, as: :id
    field :name, as: :text
    field :address, as: :text
    field :city, as: :text
    field :owners, as: :has_many
  end
end
