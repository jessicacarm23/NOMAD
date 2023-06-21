# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
ChatRoom.destroy_all
puts "Destroyed all chatrooms"

User.destroy_all
puts "Destroyed all users"

User.create!(
  email: 'test@test.com',
  password: 'password',
  name: "Jessica",
  passport: "Colombian",
  bio: "I love remote work as a developer",
  city: "London"
)

user1 = User.create(name: "Hailey", passport: "French", email: "jasmine@test.com", city: "Bogota", bio: "A nice person", password: 'password')
user2 = User.create(name: "Harry", passport: "British", email: "bill@gmail.com", city: "Bogota", bio: "Kind", password: 'password')
user3 = User.create(name: "Megan", passport: "Belgium", email: "lisa@test.com", city: "Bogota", bio: "Something", password: 'password')
# user4 = User.create(name: "Edward", passport: "Netherlands", email: "edward@gmail.com", city: "Bogota", bio: "Something", password: 'password')

user1.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "p1.png")), filename: "p1.png")
user2.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "p2.png")), filename: "p2.png")
user3.profile_picture.attach(io: File.open(Rails.root.join("app", "assets", "images", "p3.png")), filename: "p3.png")

# ChatRoom.create(name: "Chatroom something", user_initiator: User.first, user_receiver: User.last)
ChatRoom.create(name: "hello", user_initiator_id: User.first.id, user_receiver_id: User.last.id)
ChatRoom.create(name: "something chat room", user_initiator_id: User.first.id, user_receiver_id: User.last.id)
ChatRoom.create(name: "hello", user_initiator_id: User.first.id, user_receiver_id: User.last.id)
ChatRoom.create(name: "hello", user_initiator_id: User.first.id, user_receiver_id: User.last.id)
ChatRoom.create(name: "hello", user_initiator_id: User.first.id, user_receiver_id: User.last.id)
# interpolate user.name here that you're communicating with into the name of the chat room
# ChatRoom.create(name: "Chatroom", user_initiator: User.id, user_receiver: User.id)

# ChatRoom.create(name: "Chatroom something", user_initiator: User.first, user_receiver: User.last)


Article.destroy_all
puts "Destroyed all articles"

cities = [
  "Bogota", "London", "Paris", "New York", "Tokyo", "Sydney", "Rome", "Dubai", "Barcelona", "Rio de Janeiro",
  "Amsterdam", "Berlin", "Cairo", "Bangkok", "Hanoi", "Mumbai", "Cape Town", "Moscow", "Toronto", "Los Angeles",
  "San Francisco", "Dublin", "Athens", "Seoul", "Lisbon", "Vienna", "Stockholm", "Prague", "Budapest", "Istanbul"
]

cities_for_user = [
  "London", "Paris", "New York", "Tokyo", "Sydney", "Rome", "Dubai", "Barcelona", "Rio de Janeiro",
  "Amsterdam", "Berlin", "Cairo", "Bangkok", "Hanoi", "Mumbai", "Cape Town", "Moscow", "Toronto", "Los Angeles",
  "San Francisco", "Dublin", "Athens", "Seoul", "Lisbon", "Vienna", "Stockholm", "Prague", "Budapest", "Istanbul"
]

26.times do
  User.create!(
    name: Faker::Name.unique.name,
    passport: Faker::Address.country,
    email: Faker::Internet.unique.email,
    city: cities_for_user.sample,
    bio: Faker::Lorem.sentence,
    password: 'password'
  )
end

# Article.create!(user_id: user1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Visas", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Where to stay", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Where to stay", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")
# Article.create!(user_id: user1.id, topic: "Where to stay", city: "Bogota", content: "easy", title: "Easy Visa in Bogota")


topics = ["Visas", "Where to Stay", "Getting Around"]

def generate_content1(topic, city)
  case topic
  when "Visas"
    "Getting a visa to travel to #{city} is an absolute breeze. It is almost as if the locals wanted your company. The visa application process is straightforward, with clear requirements and a quick processing time. Whether you're planning a short visit or a long-term stay, obtaining a visa for #{city} is hassle-free. Rest assured, you'll be welcomed with open arms and have the opportunity to explore all the wonders that #{city} has to offer."

  when "Where to Stay"
    "When it comes to finding accommodation in #{city}, you're in for a treat. With a wide range of options to suit every budget and preference, you'll easily find the perfect place to stay. From luxurious hotels with stunning views to cozy bed and breakfasts tucked away in charming neighborhoods, #{city} offers a variety of choices. Whether you prefer a central location with easy access to attractions or a peaceful retreat away from the hustle and bustle, #{city} has it all. Prepare for a comfortable and enjoyable stay as you immerse yourself in the unique ambiance of #{city}"

  when "Getting Around"
    "Navigating #{city} is a breeze thanks to its well-developed transportation system. Whether you prefer to travel by public transport or explore on foot, #{city} has got you covered. The city boasts an extensive network of buses, trains, and trams that can take you to all the major attractions and neighborhoods. For a more adventurous experience, rent a bike and explore the city's bike-friendly lanes. With user-friendly maps and clear signage, getting around #{city} is a piece of cake."

  when "Experiences"
    "When it comes to experiences, #{city} offers an abundance of opportunities that will leave you wanting more. Explore the city's rich history and culture by visiting iconic landmarks such as #{city}'s famous museums, palaces, and cathedrals. Immerse yourself in the vibrant arts scene by attending a theater performance or art exhibition. Indulge in the local cuisine at #{city}'s renowned restaurants and cafes, and discover the city's hidden gems by exploring its charming neighborhoods. Whether you're a history buff, an art enthusiast, or a food lover, #{city} has something for everyone."
  end
end

def generate_content2(topic, city)
  case topic
  when "Visas"
    "Traveling to #{city} is made even more delightful by the ease of obtaining a visa. The locals are known for their warm hospitality and they make sure that the visa process is smooth and efficient. From submitting your application to receiving the visa, the entire process is seamless. The authorities are quick to process the applications, ensuring that you can embark on your journey to #{city} without any delays. Get ready to experience the charm and beauty of #{city} as soon as you step foot in the city."

  when "Where to Stay"
    "Choosing where to stay in #{city} is an exciting decision, as the city offers a diverse range of accommodations to suit all preferences. Whether you're seeking a luxurious hotel with panoramic views, a cozy boutique inn, or a budget-friendly hostel, #{city} has it all. Stay in the heart of the city and be surrounded by iconic landmarks and vibrant nightlife, or opt for a peaceful retreat in a tranquil neighborhood. With its extensive range of accommodations, #{city} ensures that every traveler finds their perfect home away from home."

  when "Getting Around"
    "Getting around #{city} is a breeze thanks to its well-connected transportation system. Whether you choose to travel by bus, train, or tram, you'll find that #{city}'s public transport is efficient and convenient. With regular schedules, user-friendly ticketing systems, and helpful staff, navigating the city is a stress-free experience. If you prefer to explore on foot, you'll be delighted by the pedestrian-friendly streets and well-marked walking paths. #{city} is a city that is designed for easy exploration, allowing you to make the most of your time and see all the sights."

  when "Experiences"
    "From cultural landmarks to thrilling adventures, #{city} offers a myriad of experiences that will leave you inspired and enthralled. Immerse yourself in the city's vibrant energy by exploring its lively streets, sampling local delicacies, and engaging with the friendly locals. Visit iconic attractions, such as museums and historical sites, to learn about #{city}'s rich heritage. Whether you're seeking art, history, cuisine, or outdoor adventures, #{city} has it all. Get ready to create memories that will last a lifetime as you embark on an extraordinary journey in #{city}."
  end
end

def generate_content3(topic, city)
  case topic
  when "Visas"
    "When it comes to visas, #{city} sets the bar high with its streamlined process. Applying for a visa to visit #{city} is a breeze, thanks to the friendly and efficient immigration officers. They make it their mission to make the visa process as smooth as possible, ensuring that you can focus on planning your trip and immersing yourself in the vibrant atmosphere of #{city}. With hassle-free visa procedures, #{city} welcomes travelers from around the world with open arms."

  when "Where to Stay"
    "Finding the perfect place to stay in #{city} is a breeze. With a range of accommodations to suit every taste and budget, you'll have no trouble finding your ideal home away from home. Whether you're looking for a luxury hotel with impeccable service or a charming bed and breakfast nestled in a historic neighborhood, #{city} has it all. Wake up to breathtaking views, enjoy world-class amenities, and experience the warm hospitality that #{city} is renowned for. Your stay in #{city} is sure to be unforgettable, thanks to the wide array of accommodation options available."

  when "Getting Around"
    "Embarking on a journey to #{city} is made easy with the hassle-free visa process. The local authorities have streamlined the visa application, making it a quick and straightforward process. From filling out the application form to providing the required documents, the process is designed to ensure a seamless experience. The friendly visa officers are always ready to assist and guide you through the process. You'll find that obtaining a visa for #{city} is a breeze, allowing you to focus on planning your itinerary and enjoying the vibrant city life."

  when "Experiences"
    "Discovering #{city} is an adventure that awaits you at every turn. Immerse yourself in the city's rich history by visiting ancient ruins and historical sites, or indulge in its vibrant arts scene by attending concerts, exhibitions, and performances. Explore the city's diverse neighborhoods and discover hidden gems, from charming cafes to bustling markets. Enjoy outdoor activities such as hiking, biking, or simply taking a leisurely stroll in one of #{city}'s many parks. With a wide array of experiences to choose from, #{city} ensures that every traveler finds something that resonates with them."
  end
end

def generate_content4(topic, city)
  case topic
  when "Visas"
    "Embarking on a journey to #{city} is made easy with the hassle-free visa process. The local authorities have streamlined the visa application, making it a quick and straightforward process. From filling out the application form to providing the required documents, the process is designed to ensure a seamless experience. The friendly visa officers are always ready to assist and guide you through the process. You'll find that obtaining a visa for #{city} is a breeze, allowing you to focus on planning your itinerary and enjoying the vibrant city life."

  when "Where to Stay"
    "When it comes to finding accommodation in #{city}, you'll be spoiled for choice. From luxury hotels with stunning views to cozy guesthouses tucked away in quaint neighborhoods, #{city} offers a range of options to suit every traveler's needs. Whether you're seeking a central location with easy access to attractions or a peaceful retreat for relaxation, #{city} has got you covered. The friendly and welcoming staff will ensure that your stay is comfortable and memorable, making #{city} your home away from home."

  when "Getting Around"
    "Exploring #{city} is a breeze, thanks to its excellent transportation options. The city's public transportation system, including buses, trains, and trams, is reliable and efficient, making it easy to navigate #{city}'s vibrant neighborhoods. If you prefer a more active way of getting around, you can rent a bike and explore the city's bike-friendly routes. With well-planned routes, clear signage, and helpful transport staff, #{city} ensures that you can effortlessly move from one attraction to another, allowing you to maximize your time and experience everything the city has to offer."

  when "Experiences"
    "Prepare to be captivated by the diverse range of experiences that #{city} has to offer. From strolling through #{city}'s picturesque parks and gardens to exploring its bustling markets and vibrant shopping districts, there's never a dull moment in this city. Delve into the local culture by attending festivals and events that showcase #{city}'s traditions and heritage. For adrenaline seekers, #{city} offers thrilling outdoor activities, such as hiking, water sports, and more. Get ready to create unforgettable memories as you immerse yourself in the unique experiences that #{city} has in store."
  end
end

def generate_articles1(city, topic, user)
    puts city,
    case topic
    when "Visas"
      Article.create!(
        city: city,
        title: "#{city}: A Hassle-Free Visa Experience",
        content: generate_content1(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Where to Stay"
      Article.create!(
        city: city,
        title: "Best Accommodations in #{city}",
        content: generate_content1(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Getting Around"
      Article.create!(
        city: city,
        title: "Getting Around #{city}: Transportation Guide",
        content: generate_content1(topic, city),
        topic: topic,
        user_id: user.id
      )
    end
end

def generate_articles2(city, topic, user)
    case topic
    when "Visas"
      Article.create!(
        city: city,
        title: "#{city}: Smooth Visa Procedures",
        content: generate_content2(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Where to Stay"
      Article.create!(
        city: city,
        title: "Where to Stay in #{city}",
        content: generate_content2(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Getting Around"
      Article.create!(
        city: city,
        title: "Transportation Tips for #{city}",
        content: generate_content2(topic, city),
        topic: topic,
        user_id: user.id
      )
    end
end

def generate_articles3(city, topic, user)
    case topic
    when "Visas"
      Article.create!(
        city: city,
        title: "#{city}: Seamless Visa Application Process",
        content: generate_content3(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Where to Stay"
      Article.create!(
        city: city,
        title: "Choosing the Perfect Accommodation in #{city}",
        content: generate_content3(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Getting Around"
      Article.create!(
        city: city,
        title: "#{city}: A Guide to Public Transportation",
        content: generate_content3(topic, city),
        topic: topic,
        user_id: user.id
      )
    end
end

def generate_articles4(city, topic, user)
    case topic
    when "Visas"
      Article.create!(
        city: city,
        title: "#{city}: Easy Visa Application",
        content: generate_content4(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Where to Stay"
      Article.create!(
        city: city,
        title: "Accommodation Guide: Where to Stay in #{city}",
        content: generate_content4(topic, city),
        topic: topic,
        user_id: user.id
      )
    when "Getting Around"
      puts "#{city}",
      Article.create!(
        city: city,
        title: "#{city} Transportation Guide: Getting Around with Ease",
        content: generate_content4(topic, city),
        topic: topic,
        user_id: user.id
      )
    end
end

def generate_articles(cities, topics, user)
  cities.each do |city|
    topics.each do |topic|
      generate_articles1(city, topic, user)
      generate_articles2(city, topic, user)
      generate_articles3(city, topic, user)
      generate_articles4(city, topic, user)
    end
  end
end

generate_articles(cities, topics, user1)
