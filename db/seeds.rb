puts "Destroying Restaurant DB..."
Restaurant.destroy_all

puts "Generating Restaurants..."

10.times do
  restaurant = Restaurant.create(name: Faker::Restaurant.name , address: Faker::Restaurant.description, phone_number: Faker::PhoneNumber.phone_number, category: "chinese")
  puts "Created #{Restaurant.name}!"
end

puts "Finished!"
