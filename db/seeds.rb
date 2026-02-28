puts "Creating new Clinics..."
new_clinics = 3.times.map do
  Clinic.create!(
    name: "#{Faker::Company.name} Veterinary",
    address: Faker::Address.street_address,
    city: Faker::Address.city
  )
end

puts "Creating Owners and Pets for new clinics..."
new_clinics.each do |clinic|
  # Add 5 owners to each newly created clinic
  5.times do
    owner = clinic.owners.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    )

    # Each owner gets 1 to 3 pets
    rand(1..3).times do
      owner.pets.create!(
        name: Faker::Creature::Dog.name,
        species: [ "Dog", "Cat", "Rabbit", "Hamster", "Parrot" ].sample,
        breed: Faker::Creature::Dog.breed,
        age: rand(1..15)
      )
    end
  end
end

puts "Seeding complete! Current database counts:"
puts "Clinics: #{Clinic.count}"
puts "Owners: #{Owner.count}"
puts "Pets: #{Pet.count}"
