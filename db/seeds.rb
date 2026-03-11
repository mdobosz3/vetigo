puts "Cleaning up database..."
Appointment.destroy_all
Pet.destroy_all
Owner.destroy_all
Vet.destroy_all
Clinic.destroy_all
User.destroy_all

puts "Creating new Clinics with real addresses, full staff, and patients..."

real_clinics_data = [
  { name: "Śródmieście Vet Center", address: "Marszałkowska 1", city: "Warszawa" },
  { name: "Klinika Złota Łapa", address: "Złota 44", city: "Warszawa" },
  { name: "Mokotów Animal Hospital", address: "Puławska 10", city: "Warszawa" },
  { name: "Praga Vet Care", address: "Targowa 20", city: "Warszawa" }
]

new_clinics = real_clinics_data.map do |clinic_data|
  Clinic.create!(clinic_data)
end

new_clinics.each do |clinic|
  vets = 3.times.map do
    vet_user = User.create!(
      email: Faker::Internet.unique.email,
      password: 'password123',
      password_confirmation: 'password123'
    )

    clinic.vets.create!(
      user: vet_user,
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      specialization: [ "Cardiologist", "Surgeon", "Dentist", "General Practice", "Dermatologist" ].sample
    )
  end

  5.times do
    owner = clinic.owners.create!(
      first_name: Faker::Name.first_name,
      last_name: Faker::Name.last_name,
      email: Faker::Internet.unique.email,
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
puts "Users: #{User.count}"
