# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

puts "Cleaning up database..."
UserInterest.destroy_all
Interest.destroy_all
ParticipantReview.destroy_all
Message.destroy_all
Chatroom.destroy_all
Booking.destroy_all
Faq.destroy_all
Availability.destroy_all
Order.destroy_all
Activity.destroy_all
User.destroy_all

puts "Database cleaned"
puts "Creating test user..."

test_user = User.new(
  first_name: "John",
  last_name: "Doe",
  phone_no: "88888888",
  home_address: "Singapore 761674",
  email: "johndoe@example.com",
  password: "password"
)
test_user.save!
puts "Test user created!"

#other 18 Users that created the Activities, will add in user_name after that
test_user2 = User.create(email: "test1@gmail.com", password: "123456a", first_name: "Jane", last_name: "Smith", home_address: "759160", phone_no: "12345678")
test_user3 = User.create(email: "test2@gmail.com", password: "123456b", first_name: "Michelle", home_address: "759160", last_name: "Lim", phone_no: "12345678")
test_user4 = User.create(email: "test3@gmail.com", password: "123456c", first_name: "Aisyah", home_address: "759160", last_name: "N", phone_no: "12345678")
test_user5 = User.create(email: "test4@gmail.com", password: "123456d", first_name: "Chris", home_address: "759160", last_name: "Ng", phone_no: "12345678")
test_user6 = User.create(email: "test5@gmail.com", password: "123456e", first_name: "Sarah", last_name: "Yeo", phone_no: "12345678")
test_user7 = User.create(email: "test6@gmail.com", password: "123456f", first_name: "Jamie", last_name: "Koh", phone_no: "12345678")
test_user8 = User.create(email: "test7@gmail.com", password: "123456g", first_name: "Olivia", last_name: "Ong", phone_no: "12345678")
test_user9 = User.create(email: "test8@gmail.com", password: "123456h", first_name: "Jessica", last_name: "Lee", phone_no: "12345678")
test_user10 = User.create(email: "test9@gmail.com", password: "123456i", first_name: "Michael", last_name: "Tan", phone_no: "12345678")
test_user11 = User.create(email: "test10@gmail.com", password: "123456j", first_name: "William", last_name: "Chua", phone_no: "12345678")
test_user12 = User.create(email: "test11@gmail.com", password: "123456k", first_name: "David", last_name: "Tan", phone_no: "12345678")
test_user13 = User.create(email: "test12@gmail.com", password: "123456l", first_name: "Rachel", last_name: "Wong", phone_no: "12345678")
test_user14 = User.create(email: "test13@gmail.com", password: "123456m", first_name: "Adrian", last_name: "Su", phone_no: "12345678")
test_user15 = User.create(email: "test14@gmail.com", password: "123456n", first_name: "Ivan", last_name: "Liu", phone_no: "12345678")
test_user16 = User.create(email: "test15@gmail.com", password: "123456o", first_name: "Alyssa", last_name: "Koh", phone_no: "12345678")
test_user17 = User.create(email: "test16@gmail.com", password: "123456p", first_name: "Reuben", last_name: "Koo", phone_no: "12345678")
test_user18 = User.create(email: "test17@gmail.com", password: "123456q", first_name: "Fiona", last_name: "Sim", phone_no: "12345678")
test_user19 = User.create(email: "test18@gmail.com", password: "123456r", first_name: "Jared", last_name: "Koh", phone_no: "12345678")
test_user19 = User.create(email: "test19@gmail.com", password: "123456s", first_name: "Zul", last_name: "Razali", phone_no: "12345678")
test_user20 = User.create(email: "test20@gmail.com", password: "123456t", first_name: "Siti", last_name: "Sara", phone_no: "12345678")
test_user21 = User.create(email: "test21@gmail.com", password: "123456u", first_name: "Mike", last_name: "Su", phone_no: "12345678")


# TODO: Created interests
Interest.create!(name: "Arts and Crafts", icon:'<i class="fas fa-palette"></i>')
Interest.create!(name: "Book Clubs", icon:'<i class="fas fa-book-open"></i>')
Interest.create!(name: "Cultural Celebrations", icon:'<i class="fas fa-theater-masks"></i>')
Interest.create!(name: "Charity Drives", icon: '<i class="fas fa-hand-holding-heart"></i>')
Interest.create!(name: "Education", icon:'<i class="fas fa-graduation-cap"></i>')
Interest.create!(name: "Entertainment", icon:'<i class="fas fa-gamepad"></i>')
Interest.create!(name: "Food", icon:'<i class="fas fa-hamburger"></i>')
Interest.create!(name: "Gardening", icon:'<i class="fas fa-seedling"></i>')
Interest.create!(name: "Technology", icon:'<i class="fas fa-laptop-code"></i>')
Interest.create!(name: "Music", icon:'<i class="fas fa-music"></i>')
Interest.create!(name: "Sports & Wellness", icon:'<i class="fas fa-biking"></i>')
Interest.create!(name: "SG Heritage Tours", icon:'<i class="fas fa-binoculars"></i>')
Interest.create!(name: "Social Clubs", icon:'<i class="fas fa-user-friends"></i>')
Interest.create!(name: "Professional Development", icon:'<i class="fas fa-chalkboard-teacher"></i>')

p "Created #{Interest.count} interests"
# TODO: Created activities
# Activities for H2 - What's Popular Near You
activity_1 = Activity.create(
  name: "Mahjong with Pros",
  description: "Learn and play Mahjong with experienced players for all levels." ,
  price: 60,
  max_capacity: 4,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user
)
image_urls_1 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/c_scale,e_art:refresh,w_1170/v1679720473/photo-1660099789632-ed5fae6189af_hwqji8.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680256999/MAHJONG-8-800x511_pb9nd0.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680869531/mahjong-lesson-sheet_to5gge.jpg"]

image_urls_1.each do |url|
  file = URI.open(url)
  activity_1.photos.attach(io: file, filename: "#{activity_1.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today - 2
32.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_1.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_1.save!

selected_availability = activity_1.availabilities[1]
booking_1 = Booking.new(
  user_id: test_user2.id,
  availability_id: selected_availability.id,
  activity_id: selected_availability.activity_id,
  user_name: "Jane Smith",
  number_of_pax: 2,
  status: "Confirmed",
  comment: "Looking forward to it",
  completed: true
)
booking_1.save!

selected_availability2 = activity_1.availabilities[2]
booking_2 = Booking.new(
  user_id: test_user3.id,
  availability_id: selected_availability.id,
  activity_id: selected_availability.activity_id,
  user_name: "Michelle Lim",
  number_of_pax: 3,
  status: "Confirmed",
  comment: "3 adults",
  completed: true
)
booking_2.save!

selected_availability3 = activity_1.availabilities[3]
booking_3 = Booking.new(
  user_id: test_user4.id,
  availability_id: selected_availability.id,
  activity_id: selected_availability.activity_id,
  user_name: "Aisyah N",
  number_of_pax: 4,
  status: "Confirmed",
  comment: "",
  completed: true
)
booking_3.save!

selected_availability4 = activity_1.availabilities[3]
booking_4 = Booking.new(
  user_id: test_user5.id,
  availability_id: selected_availability.id,
  activity_id: selected_availability.activity_id,
  user_name: "Chris Ng",
  number_of_pax: 2,
  status: "Confirmed",
  comment: "",
  completed: true
)
booking_4.save!


review_1 = ParticipantReview.new(
  booking_id: booking_1.id,
  activity_id: booking_1.activity_id,
  user_name: "Jane Smith",
  content: "It was fun learning about the history of mahjong!",
  activity_rating: 4
)
review_1.save!

review_2 = ParticipantReview.new(
  booking_id: booking_2.id,
  activity_id: booking_2.activity_id,
  user_name: "Michelle Lim",
  content: "I enjoyed bonding with my neighbours and learning how to play better",
  activity_rating: 3
)
review_2.save!

review_3 = ParticipantReview.new(
  booking_id: booking_3.id,
  activity_id: booking_3.activity_id,
  user_name: "Aisyah N",
  content: "It was interesting to learn about how what my Chinese friends are always up to",
  activity_rating: 5
)
review_3.save!

review_4 = ParticipantReview.new(
  booking_id: booking_4.id,
  activity_id: booking_4.activity_id,
  user_name: "Chris Ng",
  content: "It was exciting to challenge with the pros",
  activity_rating: 4
)
review_4.save!

activity_2 = Activity.create(
  name: "Yoga Flow",
  description: "Gentle yoga practice with fluid movements and breath awareness.",
  price: 8,
  max_capacity: 10,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user2
)

image_urls_2 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283374/dylan-gillis-YJdCZba0TYE-unsplash_b1vben.jpg",
  "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283409/yoga-in-singapore-freedom-yoga-900x643_fcn6l3.png"]

image_urls_2.each do |url|
file = URI.open(url)
activity_2.photos.attach(io: file, filename: "#{activity_2.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today

30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_2.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_2.save!

activity_3 = Activity.create(
  name: "Soap-making",
  description: "Create your own handmade soap using natural ingredients and essential oils!",
  price: 80,
  max_capacity: 5,
  meeting_location: "Khatib, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user3,
)

image_urls_3 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/c_scale,e_art:refresh,w_1170/v1679714865/aurelia-dubois-6J0MUsmS4fQ-unsplash_t8o5xh.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283142/image-3-1024x683_vrkdry.jpg"]

image_urls_3.each do |url|
  file = URI.open(url)
  activity_3.photos.attach(io: file, filename: "#{activity_3.name}.png", content_type: "image/png")
end

30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_3.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_3.save!

activity_4 = Activity.create(
  name: "Peranakan Nomz",
  description: "Learn to cook 3 traditional Peranakan dishes with authentic ingredients in our cozy home. The dishes include Ayam Buah Keluak, Babi Pongteh and Kueh Lapis.",
  price: 99,
  max_capacity: 5,
  meeting_location: "Khatib, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user4
)

image_urls_4 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283197/0630-0656_peranakan-food-cooking-class-singapore-pelago3-medium_zmz7qk.jpg",
  "https://res.cloudinary.com/ddk4z9ypx/image/upload/c_scale,e_art:refresh,w_1170/v1679719646/Peranakan-dishes_rohnte.jpg"]

image_urls_4.each do |url|
file = URI.open(url)
activity_4.photos.attach(io: file, filename: "#{activity_4.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_4.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_4.save!

activity_5 = Activity.create(
  name: "Chinese Tuition",
  description: "Tailored Chinese language coaching for all primary levels and ages.",
  price: 25,
  max_capacity: 1,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user5
)

image_urls_5 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283753/Dyslexia-Awareness-Singapore-child-reading-dyslexia_wgbnlq.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283901/HK_Connected-Learning_Hero_570x770-1_ldaaew.jpg"]

image_urls_5.each do |url|
file = URI.open(url)
activity_5.photos.attach(io: file, filename: "#{activity_5.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_5.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_5.save!

activity_6 = Activity.create(
  name: "Let's Bake!",
  description: "Introduction to basic baking techniques",
  price: 50,
  max_capacity: 5,
  meeting_location: "Khatib, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user6
)
image_urls_6 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680287405/Old_School_Cakes_ALL_Original_mfnoa2.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680287412/baking-classes-singapore-6_j6cuyo.jpg"]

image_urls_6.each do |url|
file = URI.open(url)
activity_6.photos.attach(io: file, filename: "#{activity_6.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_6.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_6.save!

activity_7 = Activity.create(
  name: "Mooncake Making",
  description: "Learn to make traditional mooncakes with various fillings and designs.",
  price: 90,
  max_capacity: 5,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user7
)

image_urls_7 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/c_scale,e_art:refresh,w_1170/v1679719984/photo-1633869284807-d35bbe7d8719_tibjma.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680284857/download_2_vg7nec.jpg"]

image_urls_7.each do |url|
file = URI.open(url)
activity_7.photos.attach(io: file, filename: "#{activity_7.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_7.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_7.save!

activity_8 = Activity.create(
  name: "Green Fingers",
  description: "Join me to discover gardening basics, plant care, and sustainable practices!",
  price: 25,
  max_capacity: 5,
  meeting_location: "Khatib, Singapore",
  minimum_age: 0,
  policies: "Nil",
  user: test_user8
)

image_urls_8 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285046/0112-0300_the-plant-story-singapore-pelago4_eleymq.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285114/download_3_rs2x9q.jpg"]

image_urls_8.each do |url|
  file = URI.open(url)
  activity_8.photos.attach(io: file, filename: "#{activity_8.name}.png", content_type: "image/png")
end

30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.map { |time| activity_8.availabilities.build(
  start_time: time,
  end_time: time
  )
}
activity_8.save!

activity_9 = Activity.create(
  name: "Paint and Relax",
  description: "Explore watercolour techniques to create beautiful and vibrant paintings with your family members or friends.",
  price: 40,
  max_capacity: 6,
  meeting_location: "Yishun, Singapore",
  minimum_age: "0",
  policies: "Nil",
  user: test_user9
)

image_urls_9 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285814/watercolour-painting-classes-singapore-12_szlqd0.png",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285823/watercolour-painting-classes-singapore-11_xcm6dz.png"]

image_urls_9.each do |url|
file = URI.open(url)
activity_9.photos.attach(io: file, filename: "#{activity_9.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_9.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_9.save!

# Activities for H2 - Browse Other Options

activity_10 = Activity.create(
  name: "Kids' Basketball",
  description: "Fun basketball program for kids from 6 years old onwards to learn and develop skills." ,
  price: 10,
  max_capacity: 10,
  meeting_location: "Marymount, Singapore",
  minimum_age: 6,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user10
)
image_urls_10 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285454/SG_Basketball_Trial_Class_xx6ock.jpg",
                  "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285462/IMG_1112_egt9pi.jpg"]

image_urls_10.each do |url|
file = URI.open(url)
activity_10.photos.attach(io: file, filename: "#{activity_10.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_10.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_10.save!

activity_11 = Activity.create(
  name: "Bird Watching",
  description: "Discover the art of birdwatching through guided observation!",
  price: 30,
  max_capacity: 3,
  meeting_location: "Canberra, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user11
)

image_urls_11 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680284664/ricemedia-heartland-bird-uncle-9_vwfwjn.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680284671/e45ba262750474788e4c37b0e303dd12-scaled_pky4sh.jpg"]

image_urls_11.each do |url|
file = URI.open(url)
activity_11.photos.attach(io: file, filename: "#{activity_11.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_11.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_11.save!

activity_12 = Activity.create(
  name: "On 2 wheels",
  description: "3-hour beginner-friendly indoor cycling sessions guided by Coach John with 10 years experience.",
  price: 50,
  max_capacity: 5,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user12
)

image_urls_12 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285919/e-cycling-lesson-01_bp9k15.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680285928/46-1024x768_vnthcp.jpg"]

image_urls_12.each do |url|
file = URI.open(url)
activity_12.photos.attach(io: file, filename: "#{activity_12.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_12.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_12.save!

activity_13 = Activity.create(
  name: "The Art of Scent",
  description: "Create custom scents using high-quality ingredients and expert guidance.",
  price: 80,
  max_capacity: 4,
  meeting_location: "Jurong, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user13
)
image_urls_13 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680286763/1-4_nqtqse.webp",
                 "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680286791/download_5_m2un1d.jpg"]

image_urls_13.each do |url|
file = URI.open(url)
activity_13.photos.attach(io: file, filename: "#{activity_13.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_13.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_13.save!

activity_14 = Activity.create(
  name: "Maths Tuition",
  description: "Effective maths coaching for students to improve understanding and performance.",
  price: 30,
  max_capacity: 1,
  meeting_location: "Bishan, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user14
)

image_urls_14 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680284347/Caring-primary-school-maths-tuition_ufd3tn.jpg",
                 "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680284504/Pri-Math_xsaria.png"]

image_urls_14.each do |url|
file = URI.open(url)
activity_14.photos.attach(io: file, filename: "#{activity_14.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_14.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_14.save!

activity_15 = Activity.create(
  name: "How To Code 101",
  description: "Introduction to coding concepts and skills for beginners. Notes will be provided!" ,
  price: 88,
  max_capacity: 5,
  meeting_location: "Woodlands, Singapore",
  minimum_age: 0,
  policies: "Please bring your own laptop.",
  user: test_user15
)
image_urls_15 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/c_scale,e_art:refresh,w_1170/v1679720974/photo-1675495277087-10598bf7bcd1_wp0qrh.jpg",
                 "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680286441/Online_or_Offline_Preface_Coding_Private_Course_for_Adults_mr3uby.jpg"]

image_urls_15.each do |url|
file = URI.open(url)
activity_15.photos.attach(io: file, filename: "#{activity_15.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_15.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_15.save!

activity_16 = Activity.create(
  name: "Knitting Class",
  description: "Discover the art of knitting and create beautiful handmade pieces with various patterns and yarns. Invite your friends along!",
  price: 20,
  max_capacity: 10,
  meeting_location: "Bishan, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user16
)
image_urls_16 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283070/pexels-alex-green-5693380-scaled-735x471_gxzkcl.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680283073/crotchet-artists-group-shot-1040x585-1_ugrka3.webp",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1679721433/meg-wagener-vuXTB1lR3AY-unsplash_xldwsn.jpg"]

image_urls_16.each do |url|
file = URI.open(url)
activity_16.photos.attach(io: file, filename: "#{activity_16.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_16.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_16.save!

activity_17 = Activity.create(
  name: "Strum + Sing",
  description: "Learn to play guitar with chord progressions and strumming techniques.",
  price: 70,
  max_capacity: 1,
  meeting_location: "Admiralty, Singapore",
  minimum_age: 0,
  policies: "You can bring your own guitar or use the teacher's guitar ranging from classical, acoustic to electric",
  user: test_user17
)
image_urls_17 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1679714826/oleg-ivanov-iB_h6EFRiKY-unsplash_vkxphf.jpg",
                 "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680288361/stella1-1024x576_mksswm.jpg"]

image_urls_17.each do |url|
file = URI.open(url)
activity_17.photos.attach(io: file, filename: "#{activity_17.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_17.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_17.save!

activity_18 = Activity.create(
  name: "Elderly Care",
  description: "Elderly Care is a community initiative that aims to provide assistance to the elderly population living in the local area. As people age, they often require additional support to maintain their health and wellbeing. This is where Elderly Care comes in - we are a group of like-minded individuals who are passionate about making a positive impact in the lives of our elderly neighbors.",
  price: 5,
  max_capacity: 4,
  meeting_location: "Bishan, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user18
)
image_urls_18 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680287085/7.-Image-by-TOUCH-Community-Services_h12x8y.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680287090/ME7_kozwmf.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1680287096/Rini_3_mcvfpq.jpg"]

image_urls_18.each do |url|
file = URI.open(url)
activity_18.photos.attach(io: file, filename: "#{activity_18.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_18.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_18.save!

activity_19 = Activity.create(
  name: "Granny Nasi Lemak",
  description: "Nasi Lemak is a traditional Malaysian dish that is popular throughout Southeast Asia. It is typically made with coconut rice, fried chicken or fish, sambal sauce, boiled eggs, cucumber slices, and roasted peanuts. Join us in this session to learn our Grandma's recipe!",
  price: 60,
  max_capacity: 5,
  meeting_location: "Canberra, Singapore",
  minimum_age: 0,
  policies: "No cancellation is allowed",
  user: test_user19
)
image_urls_19 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681138444/shutterstock_648976399_p7l5yt.webp",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681121058/fun-in-class_t1jsn3.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681138423/nasi-lemak-cooking_bmqdfp.webp"]

image_urls_19.each do |url|
file = URI.open(url)
activity_19.photos.attach(io: file, filename: "#{activity_19.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_19.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_19.save!

activity_20 = Activity.create(
  name: "Hari Raya Delights",
  description: "Hari Raya is a festive occasion celebrated by Muslims around the world. It marks the end of Ramadan, a month-long period of fasting, and is a time of joy, gratitude, and celebration. Traditional dishes play an important role in Hari Raya festivities, and some of the most popular dishes are Ketupat, Rendang, and Lemang.",
  price: 75,
  max_capacity: 4,
  meeting_location: "Canberra, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user20
)
image_urls_20 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681138679/AH_Pui_Satay_b54n4y.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681138689/sun-may-hiong-satay-house_xwjcrw.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681138966/3086f0ef5c58e30c1c9a1876487_original__zhylvf.avif"]

image_urls_20.each do |url|
file = URI.open(url)
activity_20.photos.attach(io: file, filename: "#{activity_20.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_20.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_20.save!

activity_21 = Activity.create(
  name: "Dangerous Yishun?",
  description: "There have been reports of criminal activity in Yishun, a suburban town in the northern part of Singapore, which has led to it being labeled as a dangerous  town by some people. Let us show you around the beauty of Yishun as it is not what the media has depicted!",
  price: 15,
  max_capacity: 4,
  meeting_location: "Yishun, Singapore",
  minimum_age: 0,
  policies: "Please inform us for rescheduling in the event you are unwell",
  user: test_user21
)
image_urls_21 = ["https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681139907/yishun-block-666_zed7u2.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681139945/Street-talk-yishun-6_l8znst.jpg",
                "https://res.cloudinary.com/ddk4z9ypx/image/upload/v1681139940/Cover-Places-To-Visit-Yishunepb0310_qmmvji.webp"]

image_urls_21.each do |url|
file = URI.open(url)
activity_21.photos.attach(io: file, filename: "#{activity_21.name}.png", content_type: "image/png")
end

availabilities = []
date = Date.today
30.times do
  availabilities << date.strftime("%Y-%m-%d")
  date += 1.day
end

availabilities.each do |time|
  activity_21.availabilities.build(
    start_time: time,
    end_time: time
  )
end

activity_21.save!


p "Created #{Activity.count} activities"

# # # TODO: Created FAQs
faqs = [
  ["What is the price if my 2 children are coming along without participating", "They can just join in without a charge."],
  ["Hi, can I book for 2 pax?", "Please kindly make another booking."],
  ["What is the price for student?", "Hi, the price rate will be similar - there is no discount at the moment but do check back!"]
]


Activity.all.each do |activity|
  faqs.each do |faq|
    activity.faqs.create(question: faq[0], answer: faq[1])
  end
end


# TODO: Created booking
# booking_1 = Booking.create(
#   user_name: "Jane Smith",
#   number_of_pax: 2,
#   status: "Confirmed",
#   comment: "Looking forward to it",
#   completed: false
# )
# # find an availability to link with the booking
# activity_1 = Activity.first
# availability_1 = Availability.first
# user_1 = User.second

# link the booking with the availability
# booking_1.availability = availability_1
# booking_1.activity = activity_1
# booking_1.user = user_1

# # save the booking
# booking_1.save!

# booking_2 = Booking.create(
#   user_name: "Michelle Lim",
#   number_of_pax: 3,
#   status: "Confirmed",
#   comment: "3 adults",
#   completed: false
# )
# availability_2 = Availability.second
# activity_2 = Activity.first
# user_2 = User.third

# booking_2.availability = availability_2
# booking_2.activity = activity_2
# booking_2.user = user_2

# booking_2.save!

p "Created #{Booking.count} bookings"

# TODO: Participant Reviews for Each Activity
# review_1 = ParticipantReview.create(content: "It was fun learning about the history of mahjong!", activity_rating: 4, user_name: "Jane Smith")
# review_1.activity = activity_1
# review_1.booking = booking_1
# review_1.save!

# review_2 = ParticipantReview.create(content: "I enjoyed bonding with my neighbours and learning how to play better", activity_rating: 3, user_name: "Michelle Lim")
# review_2.activity = activity_1
# review_2.booking = booking_1
# review_2.save!

# review_3 = ParticipantReview.create(content: "It was interesting to learn about how what my Chinese friends are always up to", activity_rating: 2, user_name: "Jamie Koh")
# review_3.activity = activity_1
# review_3.booking = booking_1
# review_3.save!

# review_4 = ParticipantReview.create(content: "It was exciting to challenge with the pros", activity_rating: 4, user_name: "Evonne Li")
# review_4.activity = activity_1
# review_4.booking = booking_1
# review_4.save!

p "Created #{ParticipantReview.count} participant_reviews"
# # # TODO: Host Reviews for Each Booking
# # Host_review.create(user_rating: 4.5, booking_id: 1)
# # Host_review.create(user_rating: 2, booking_id: 2)

interests_1 = ["Entertainment"]
interests_1.each do |interest|
  activity_1.interests << Interest.find_by(name: interest)
end

interests_2 = ["Sports & Wellness"]
interests_2.each do |interest|
  activity_2.interests << Interest.find_by(name: interest)
end

interests_3 = ["Entertainment"]
interests_3.each do |interest|
  activity_3.interests << Interest.find_by(name: interest)
end

interests_4 = ["Cultural Celebrations", "Food"]
interests_4.each do |interest|
  activity_4.interests << Interest.find_by(name: interest)
  activity_4.interests << Interest.find_by(name: interest)
end

interests_5 = ["Professional Development","Education"]
interests_5.each do |interest|
  activity_5.interests << Interest.find_by(name: interest)
end

interests_6 = ["Food","Entertainment"]
interests_6.each do |interest|
  activity_6.interests << Interest.find_by(name: interest)
end

interests_7 = ["Food", "Entertainment","Cultural Celebrations"]
interests_7.each do |interest|
  activity_7.interests << Interest.find_by(name: interest)
end

interests_8 = ["Gardening","Entertainment"]
interests_8.each do |interest|
  activity_8.interests << Interest.find_by(name: interest)
end

interests_9 = ["Entertainment","Arts and Crafts"]
interests_9.each do |interest|
  activity_9.interests << Interest.find_by(name: interest)
end

interests_10 = ["Sports & Wellness", "Entertainment"]
interests_10.each do |interest|
  activity_10.interests << Interest.find_by(name: interest)
end

interests_11 = ["Cultural Celebrations","Social Clubs","Entertainment"]
interests_11.each do |interest|
  activity_11.interests << Interest.find_by(name: interest)
end


interests_11 = ["Cultural Celebrations", "SG Heritage Tours"]
interests_11.each do |interest|
  activity_11.interests << Interest.find_by(name: interest)
end


interests_12 = ["Sports & Wellness"]
interests_12.each do |interest|
  activity_12.interests << Interest.find_by(name: interest)
end


interests_13 = ["Entertainment"]
interests_13.each do |interest|
  activity_13.interests << Interest.find_by(name: interest)
end


interests_14 = ["Professional Development","Education"]
interests_14.each do |interest|
  activity_14.interests << Interest.find_by(name: interest)
end


interests_15 = ["Technology", "Professional Development","Education"]
interests_15.each do |interest|
  activity_15.interests << Interest.find_by(name: interest)
end


interests_16 = ["Entertainment","Arts and Crafts"]
interests_16.each do |interest|
  activity_16.interests << Interest.find_by(name: interest)
end


interests_17 = ["Entertainment","Music"]
interests_17.each do |interest|
  activity_17.interests << Interest.find_by(name: interest)
end


interests_18 = ["Charity Drives"]
interests_18.each do |interest|
  activity_18.interests << Interest.find_by(name: interest)
end


interests_19 = ["Cultural Celebrations", "Food"]
interests_19.each do |interest|
  activity_19.interests << Interest.find_by(name: interest)
end

interests_20 = ["Cultural Celebrations", "Food"]
interests_20.each do |interest|
  activity_20.interests << Interest.find_by(name: interest)
end

interests_21 = ["SG Heritage Tours"]
interests_21.each do |interest|
  activity_21.interests << Interest.find_by(name: interest)
end
