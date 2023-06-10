# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
puts "destroyed all users"
User.create!(
  email: 'test@test.com',
  password: 'password'
)

user_1 = User.create(name: "Jasmine", passport: "French", email: "jasmine@test.com", city: "London", bio: "A nice person", password: 'password')
user_2 = User.create(name: "Bill", passport: "British", email: "bill@gmail.com", city: "Paris", bio: "kind",password: 'password')
user_3 = User.create(name: "Lisa", passport: "Belgium", email: "Lisa@test.com", city: "London", bio: "something", password: 'password')
user_4 = User.create(name: "Edward", passport: "Netherlands", email: "Edward@gmail.com", city: "Paris", bio: "something",password: 'password')

# User.create(name: "Jasmine", passport: "French", email: "test@test.com", city: "London", bio: "A nice person")
# User.create(name: "Bill", passport: "British", email: "bill@gmail.com", city: "Paris", bio: "kind")
# User.create(name: "Lisa", passport: "Belgium", email: "Lisa@test.com", city: "London", bio: "something")
# User.create(name: "Edward", passport: "Netherlands", email: "Edward@gmail.com", city: "Paris", bio: "something")

Article.destroy_all
puts "destroyed all articles"
  Article.create!(user_id: user_1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
  Article.create(user_id: user_2.id, topic: "Getting Around", city: "London", content: "easy", title: "Easy to get around in London")
  Article.create(user_id: user_3.id, topic: "Experiences", city: "Bogota", content: "fun place", title: "Bogota is fun")
  Article.create(user_id: user_4.id, topic: "Getting Here", city: "London", content: "super easy to London", title: "Getting to London")
  # Article.create(topic: "Visas", city: "Bogota", content: "easy")
  # Article.create( topic: "Getting Around", city: "London", content: "easy")
  # Article.create(topic: "Experiences", city: "Bogota", content: "fun place")
  # Article.create( topic: "Getting Here", city: "London", content: "super easy to London")
