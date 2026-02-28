FactoryBot.define do
  factory :clinic do
    name { "#{Faker::Company.name} Veterinary" }
    address { Faker::Address.street_address }
    city { Faker::Address.city }
  end
end
