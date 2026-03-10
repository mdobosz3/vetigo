FactoryBot.define do
  factory :medical_record do
    association :pet
    association :appointment
    symptoms { "Lethargy and loss of appetite." }
    treatment { "Prescribed vitamins and recommended rest." }
  end
end
