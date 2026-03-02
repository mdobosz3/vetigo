FactoryBot.define do
  factory :vet do
    clinic
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    specialization { [ "Cardiologist", "Surgeon", "Dentist", "General Practice" ].sample }
  end
end
