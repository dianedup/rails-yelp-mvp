# require 'faker' => pas necessaire car avec rails toutes les gems sont required

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'
Restaurant.destroy_all

puts 'Creating restaurants and reviews...'

5.times do
  # create a restaurant
  restaurant = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.full_address,
    phone_number: Faker::PhoneNumber.phone_number_with_country_code,
    category: Restaurant::CATEGORIES.sample,
    )
  restaurant.save!
  #create reviews for this restaurant
  number_of_reviews = (0..6).to_a.sample
  number_of_reviews.times do
    review = Review.new(
      content: Faker::Restaurant.review,
      rating: Review::RATINGS.to_a.sample,
    )
    review.restaurant = restaurant
    review.save!

  end

end
puts 'Finished!'
