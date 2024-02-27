#Drop db

puts "Dropping current data"
Booking.destroy_all
Tour.destroy_all
Category.destroy_all
User.destroy_all

# Creating three different categories
puts "creating three categories"
categories = []

cat_1 = Category.create! :title => 'Walking', :description => 'Walking tour that requires... Walking'
categories << cat_1
cat_2 = Category.create! :title => 'Segway', :description => 'Segway tour for the adve... lazy!'
categories << cat_2
cat_3 = Category.create! :title => 'Biking', :description => 'For the ones who want to explore a lot!!!'
categories << cat_3


# Creating 10 users with 2 tours each
puts "creating 10 users with 2 tours each"

num = 0
languages = ["Spanish", "English", "French", "Swedish"]
locations = ["Barceona", "Madrid", "Tolouse", "Stockholm", "Buenos Aires"]
10.times do
  user = User.create! :first_name => "john#{num}", :last_name => "doe#{num}", :email => "john#{num}@gmail.com", :password => 'topsecret', :password_confirmation => 'topsecret'
  num += 1
  2.times do
    Tour.create! :title => 'Awesome Title', :description => 'Awesome description', :duration => rand(30..90), :max_spots => rand(1..100), :price_per_person => rand(10..100), :date => Date.tomorrow, :category_id => categories[rand(0..2)].id, :language => languages[rand(0..3)], :location => locations[rand(0..4)], :user_id => user.id
  end
end

# Creating 3 bookings for last tour
puts "Creating 3 bookings for last tour"

User.excluding(Tour.last.user).sample(3).each do |u|
  Booking.create! tour: Tour.last, user: u, nb_of_people: 1
end
