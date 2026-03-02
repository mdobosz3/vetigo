FactoryBot.define do
  factory :appointment do
    pet
    vet
    scheduled_at { 1.week.from_now }
    reason { Faker::Lorem.sentence }
    status { "scheduled" }
  end
end
