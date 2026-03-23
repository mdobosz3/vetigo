FactoryBot.define do
  factory :pet do
    user
    name { Faker::Creature::Dog.name }
    species { [ "Dog", "Cat", "Rabbit", "Hamster" ].sample }
    breed { Faker::Creature::Dog.breed }
    birth_date { Faker::Date.birthday(min_age: 1, max_age: 15) }
  end
end
