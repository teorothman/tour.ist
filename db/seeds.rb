#Drop db

puts "Dropping current data"
Tour.destroy_all
Category.destroy_all
User.destroy_all
Review.destroy_all

# Creating three different categories
puts "creating three categories"
categories = []

cat_1 = Category.create! title: 'Walking', description: 'Walking tour that requires... Walking'
categories << cat_1
cat_2 = Category.create! title: 'Segway', description: 'Segway tour for the adve... lazy!'
categories << cat_2
cat_3 = Category.create! title: 'Biking', description: 'For the ones who want to explore a lot!!!'
categories << cat_3


# Creating 10 users with 2 tours each
puts "creating 10 users with 2 tours each"

num = 0
languages = ["Spanish", "English", "French", "Swedish"]
locations = ["Barceona", "Madrid", "Tolouse", "Stockholm", "Buenos Aires"]
10.times do
  user = User.create! first_name: "john#{num}", last_name: "doe#{num}", email: "john#{num}@gmail.com", password: 'topsecret'
  num += 1
  2.times do
    tour = Tour.create! title: 'Awesome Title', description: 'Awesome description', duration: rand(30..90), max_spots: rand(1..100), price_per_person: rand(10..100), date: Date.tomorrow, category_id: categories[rand(0..2)].id, language: languages[rand(0..3)], location: locations[rand(0..4)], user_id: user.id
    User.excluding(tour.user).sample(rand(0..tour.max_spots)).each do |user|
      Booking.create! user: user, total_price:
    end
  end
end

# Creating Reviews!
#puts "Creating reviews for our tours"

# Review.create([
#   { content: "Great Bike Tour!", rating: 5, date: Date.new(2024, 1, 15), :booking_id => user.id },
#   { content: "Could be better", rating: 5, date: Date.new(2024, 2, 5), :booking_id => user.id  },
#   { content: "Great Walking tour", rating: 4, date: Date.new(2024, 2, 20), :booking_id => user.id  }
# ])
