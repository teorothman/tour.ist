require 'faker'

#Drop db

puts "Dropping current data"
Booking.destroy_all
Tour.destroy_all
Category.destroy_all
User.destroy_all

# Creating three different categories
puts "creating three categories"
categories = []

cat_1 = Category.create! title: 'Walking', description: 'Walking tour that requires... Walking'
categories << cat_1
cat_2 = Category.create! title: 'Segway', description: 'Segway tour for the adve... lazy!'
categories << cat_2
cat_3 = Category.create! title: 'Biking', description: 'Tour for the ones who want to explore a lot!!!'
categories << cat_3


# Creating 10 users with 2 tours each
puts "creating 10 users with 2 tours each"

languages = ["Spanish", "English", "French", "Swedish"]
locations = ["Barceona", "Madrid", "Tolouse", "Stockholm", "Buenos Aires"]
10.times do
  f_name = Faker::Name.unique.first_name

  user = User.create! first_name: f_name,
                      last_name: Faker::Name.unique.last_name,
                      email: "#{f_name.downcase}@gmail.com",
                      password: 'topsecret'

  2.times do
    location = locations[rand(0..4)]
    category = categories[rand(0..2)]
    title = "A #{category.title.downcase} tour of #{location}"
    description = "Explore the heart of #{location} with #{user.first_name}... #{category.description}"
    Tour.create! title: title, description: description, duration: rand(30..90), max_spots: rand(1..15), price_per_person: rand(10..100), date: Date.tomorrow, category: category, language: languages[rand(0..3)], location: location, user: user
  end
end

# Creating 3 bookings for last tour
puts "Creating 3 bookings for last tour"

User.excluding(Tour.last.user).sample(3).each do |u|
  Booking.create! tour: Tour.last, user: u, nb_of_people: 1
end
