FactoryBot.define do
  factory :pet do
    owner
    name { Faker::Creature::Dog.name }
    species { [ "Dog", "Cat", "Rabbit", "Hamster" ].sample }
    breed { Faker::Creature::Dog.breed }
    age { rand(1..15) }
  end
end
