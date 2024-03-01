
#Drop db

puts "Dropping current data"
Review.destroy_all
Booking.destroy_all
Tour.destroy_all
Category.destroy_all
User.destroy_all

# Creating three different categories
puts "Creating three categories"
categories = []

cat_1 = Category.create! title: 'Walking', description: 'Walking tour that requires... Walking'
categories << cat_1
cat_2 = Category.create! title: 'Segway', description: 'Segway tour for the adve... lazy!'
categories << cat_2
cat_3 = Category.create! title: 'Biking', description: 'Tour for the ones who want to explore a lot!!!'
categories << cat_3

# Creating 10 users with 2 tours each
puts "Creating 10 users with 2 tours each"

languages = ["Spanish", "English", "French", "Swedish"]
locations = ["Barcelona", "Madrid", "Toulouse", "Stockholm", "Marseille", "Paris", "Lyon"]
dates = [DateTime.tomorrow, Date.tomorrow + 5, Date.tomorrow + 10]

puts "Creating admin user: Martin Miranda"
martin_pic = URI.open("https://source.unsplash.com/random/?face/")
admin_user = User.new(
  first_name: "Martin",
  last_name: "Miranda",
  email: "martin@gmail.com",
  password: 'topsecret'
)
admin_user.photo.attach(io: martin_pic, filename: "martin.png", content_type: "image/png")
admin_user.save


10.times do
  f_name = Faker::Name.unique.first_name

  face_pic = URI.open("https://source.unsplash.com/random/?face/")
  user = User.new(
    first_name: f_name,
    last_name: Faker::Name.unique.last_name,
    email: "#{f_name.downcase}@gmail.com",
    password: 'topsecret'
  )
  user.photo.attach(io: face_pic, filename: "#{f_name}.png", content_type: "image/png")
  user.save

  2.times do
    location = locations[rand(0..4)]
    category = categories[rand(0..2)]
    title = "A #{category.title.downcase} tour of #{location}"
    description = "Explore the heart of #{location} with #{user.first_name}... #{category.description}"

    # PHOTO FETCHING
    file = URI.open("https://source.unsplash.com/random/?#{location}/")
    tour = Tour.new(
      title: title, description: description, duration: rand(30..90),
      max_spots: rand(1..15), price_per_person: rand(10..100), date: dates[rand(0..2)], category: category, language: languages[rand(0..3)], location: location, user: user
    )
    tour.photo.attach(io: file, filename: "#{location}.png", content_type: "image/png")
    tour.save

    # Tour.create!
    # title: title, description: description, duration: rand(30..90),
    # max_spots: rand(1..15), price_per_person: rand(10..100), date: dates[rand(0..2)], # category: category, language: languages[rand(0..3)], location: location, user: user
  end
end


# THIS WAS TO CREATE FIXED ADMIN TOUR AND BOOKINGS
puts "Creating admin tour with bookings for Martin Miranda"
file = URI.open("https://source.unsplash.com/random/?Barcelona/")
category = categories[rand(0..2)]
tour_admin = Tour.new(
  title: "Christmas tour",
  description: "Experience this christmasy time of the year in Barcelona like a local",
  duration: rand(30..90), max_spots: rand(1..15), price_per_person: rand(10..100), date: DateTime.new(2023, 12, 12, 18, 30, 00), category: category, language: languages[rand(0..3)], location: "Barcelona", user: admin_user
)
tour_admin.photo.attach(io: file, filename: "Barcelona_by_Martin.png", content_type: "image/png")
tour_admin.save


Booking.create! tour: tour_admin, user: admin_user, nb_of_people: 3, is_private: false

# Creating 3 bookings for last tour
puts "Creating 3 bookings for last tour"

User.excluding(Tour.last.user).sample(3).each do |u|
  Booking.create! tour: Tour.last, user: u, nb_of_people: 1
end
