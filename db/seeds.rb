puts "Creating new Clinics with full staff and patients..."

new_clinics = 2.times.map do
  Clinic.create!(
    name: "#{Faker::Company.name} Veterinary Hospital",
    address: Faker::Address.street_address,
    city: Faker::Address.city
  )
end

new_clinics.each do |clinic|
  vets = 3.times.map do
    clinic.vets.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      specialization: [ "Cardiologist", "Surgeon", "Dentist", "General Practice", "Dermatologist" ].sample
    )
  end

  5.times do
    owner = clinic.owners.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.email,
      phone: Faker::PhoneNumber.phone_number
    )

    pets = rand(1..3).times.map do
      owner.pets.create!(
        name: Faker::Creature::Dog.name,
        species: [ "Dog", "Cat", "Rabbit", "Hamster", "Parrot" ].sample,
        breed: Faker::Creature::Dog.breed,
        age: rand(1..15)
      )
    end

    pets.each do |pet|
      rand(1..4).times do
        Appointment.create!(
          pet: pet,
          vet: vets.sample,
          scheduled_at: Faker::Time.forward(days: 30, period: :morning),
          reason: [ "Annual checkup", "Vaccination", "Tooth extraction", "Stomach ache", "Limping" ].sample,
          status: [ "scheduled", "completed", "cancelled" ].sample
        )
      end
    end
  end
end

puts "Seeding complete! Current database counts:"
puts "Clinics: #{Clinic.count}"
puts "Vets: #{Vet.count}"
puts "Owners: #{Owner.count}"
puts "Pets: #{Pet.count}"
puts "Appointments: #{Appointment.count}"
