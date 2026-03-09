FactoryBot.define do
  factory :medical_record do
    pet { nil }
    appointment { nil }
    symptoms { "MyText" }
    treatment { "MyText" }
  end
end
