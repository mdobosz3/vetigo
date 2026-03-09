class Avo::Resources::MedicalRecord < Avo::BaseResource
  def fields
    main_panel do
      field :id, as: :id
      field :pet, as: :belongs_to,
            required: true,
            default: -> {
              if params[:via_relation] == "appointment"
                Appointment.find_by(id: params[:via_record_id])&.pet_id
              end
            },
            readonly: -> { params[:via_relation] == "appointment" }
      field :appointment, as: :belongs_to, required: true
      field :symptoms, as: :textarea, always_show: true
      field :treatment, as: :textarea, always_show: true
    end
  end
end
