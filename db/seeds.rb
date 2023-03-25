# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Cleaning up database..."
Activity.destroy_all
User.destroy_all
puts "Database cleaned"
puts "Creating test user..."
User.destroy_all
test_user = User.new(
  first_name: "John",
  last_name: "Doe",
  phone_no: "88888888",
  email: "johndoe@example.com",
  password: "password"
)
test_user.save!
puts "Test user created!"


#other 12 Users that created the Activities
User.create(email: "test1@gmail.com", password: "123456a", first_name: "Samantha", last_name: "Tan", phone_no: "12345678")
User.create(email: "test2@gmail.com", password: "123456b", first_name: "Daniel", last_name: "Lim", phone_no: "12345678")
User.create(email: "test3@gmail.com", password: "123456c", first_name: "Emily", last_name: "Cheong", phone_no: "12345678")
User.create(email: "test4@gmail.com", password: "123456d", first_name: "Christopher", last_name: "Ng", phone_no: "12345678")
User.create(email: "test5@gmail.com", password: "123456e", first_name: "Sarah", last_name: "Yeo", phone_no: "12345678")
User.create(email: "test6@gmail.com", password: "123456f", first_name: "James", last_name: "Koh", phone_no: "12345678")
User.create(email: "test7@gmail.com", password: "123456g", first_name: "Olivia", last_name: "Ong", phone_no: "12345678")
User.create(email: "test8@gmail.com", password: "123456h", first_name: "Michael", last_name: "Lee", phone_no: "12345678")
User.create(email: "test9@gmail.com", password: "123456i", first_name: "Jessica", last_name: "Tan", phone_no: "12345678")
User.create(email: "test10@gmail.com", password: "123456j", first_name: "William", last_name: "Chua", phone_no: "12345678")
User.create(email: "test11@gmail.com", password: "123456k", first_name: "Rachel", last_name: "Tan", phone_no: "12345678")
User.create(email: "test12@gmail.com", password: "123456l", first_name: "David", last_name: "Wong", phone_no: "12345678")


# # other 12 Users that created the Activities (after home_address change to integer)
# User.create(email: "test1@gmail.com", password: "123456a", first_name: "Samantha", last_name: "Tan", home_address: "760618", contact_number: "12345678")
# User.create(email: "test2@gmail.com", password: "123456b", first_name: "Daniel", last_name: "Lim", home_address: "760618", contact_number: "12345678"
# User.create(email: "test3@gmail.com", password: "123456c", first_name: "Emily", last_name: "Cheong", home_address: "760618", contact_number: "12345678")
# User.create(email: "test4@gmail.com", password: "123456d", first_name: "Christopher", last_name: "Ng", home_address: "760618", contact_number: "12345678")
# User.create(email: "test5@gmail.com", password: "123456e", first_name: "Sarah", last_name: "Yeo", home_address: "760618" contact_number: "12345678")
# User.create(email: "test6@gmail.com", password: "123456f", first_name: "James", last_name: "Koh", home_address: "760618", contact_number: "12345678")
# User.create(email: "test7@gmail.com", password: "123456g", first_name: "Olivia", last_name: "Ong", home_address: "760618", contact_number: "12345678")
# User.create(email: "test8@gmail.com", password: "123456h", first_name: "Michael", last_name: "Lee", home_address: "760618", contact_number: "12345678")
# User.create(email: "test9@gmail.com", password: "123456i", first_name: "Jessica", last_name: "Tan", home_address: "760618", contact_number: "12345678"
# User.create(email: "test10@gmail.com", password: "123456j", first_name: "William", last_name: "Chua", home_address:  "760618", contact_number: "12345678")
# User.create(email: "test11@gmail.com", password: "123456k", first_name: "Rachel", last_name: "Tan", home_address: "760618", contact_number: "12345678")
# User.create(email: "test12@gmail.com", password: "123456l", first_name: "David", last_name: "Wong", home_address: "760618", contact_number: "12345678")

# other 12 Users that created the Activities with usernames
# User.create(email: "test1@gmail.com", password: "123456a", first_name: "Samantha", last_name: "Tan", home_address: "760618" , username: "samtan", contact_number: "12345678", host: true)
# User.create(email: "test2@gmail.com", password: "123456b", first_name: "Daniel", last_name: "Lim", home_address: "760618", username: "danlim", contact_number: "12345678", host: true)
# User.create(email: "test3@gmail.com", password: "123456c", first_name: "Emily", last_name: "Cheong", home_address: "760618", username: "emilyc", contact_number: "12345678", host: true)
# User.create(email: "test4@gmail.com", password: "123456d", first_name: "Christopher", last_name: "Ng", home_address: "760618", username: "chrisng", contact_number: "12345678", host: true)
# User.create(email: "test5@gmail.com", password: "123456e", first_name: "Sarah", last_name: "Yeo", home_address: "760618", username: "sarahyeo", contact_number: "12345678", host: true)
# User.create(email: "test6@gmail.com", password: "123456f", first_name: "James", last_name: "Koh", home_address: "760618", username: "jameskoh", contact_number: "12345678", host: true)
# User.create(email: "test7@gmail.com", password: "123456g", first_name: "Olivia", last_name: "Ong", home_address: "760618", username: "oliviaong", contact_number: "12345678", host: true)
# User.create(email: "test8@gmail.com", password: "123456h", first_name: "Michael", last_name: "Lee", home_address: "760618", username: "michaellee", contact_number: "12345678", host: true)
# User.create(email: "test9@gmail.com", password: "123456i", first_name: "Jessica", last_name: "Tan", home_address: "760618", username: "jesstan", contact_number: "12345678", host: true)
# User.create(email: "test10@gmail.com", password: "123456j", first_name: "William", last_name: "Chua", home_address:  "760618", username: "williamchua", contact_number: "12345678", host: true)
# User.create(email: "test11@gmail.com", password: "123456k", first_name: "Rachel", last_name: "Tan", home_address: "760618", username: "rachtan", contact_number: "12345678", host: true)
# User.create(email: "test12@gmail.com", password: "123456l", first_name: "David", last_name: "Wong", home_address: "760618", username: "davidwong", contact_number: "12345678", host: true)

# Activities for What's Popular Near You
Activity.create(name: "How to Cycle for Beginners", description: "3-hour beginner-friendly indoor cycling sessions guided by Coach Max Lee with 10 years experience.", price: "$50", max_capacity: "5" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 1)
Activity.create(name: "Yoga Flow", description: "Gentle yoga practice with fluid movements and breath awareness.", price: "$8" , max_capacity: "10" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Nil", user_id: 2)
Activity.create(name: "Organic Soap-making", description: "Create your own handmade soap using natural ingredients and essential oils!" , price: "$80" , max_capacity: "5" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Nil", user_id: 3)
Activity.create(name: "My Grandmother's Chinese Dishes", description: "Learn to cook 3 traditional Peranakan dishes with authentic ingredients in our cozy home. The dishes include Ayam Buah Keluak, Babi Pongteh and Kueh Lapis.", price: "$100" , max_capacity: "5" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Nil", user_id: 4)
Activity.create(name: "Chinese Tuition", description: "Tailored Chinese language coaching for all orimary levels and ages." , price: "$25/p", max_capacity: "1" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Nil", user_id: 5)
Activity.create(name: "Data Analysis 101", description: "Introduction to data analysis concepts and tools for beginners." , price: "$50", max_capacity: "5" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Nil", user_id: 6)

# Activities for Browse Other Options
Activity.create(name: "Basketball for Youth", description: "Fun basketball program for kids to learn and develop skills." , price: "$10" , max_capacity: "10" , availability: "17-04-2023" , meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 7)
Activity.create(name: "Art of Bird Watching", description: "Discover the art of birdwatching through guided observation and identification." , price: "$30" , max_capacity: "3" , availability: "17-04-2023" , meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 8)
Activity.create(name: "Mahjong with Pros", description: "Learn and play Mahjong with experienced players for all levels." , price: "$60" , max_capacity: "4" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 9)
Activity.create(name: "Perfume Making Workshop", description: "Create custom scents using high-quality ingredients and expert guidance.", price: "$80" , max_capacity: "4" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 10)
Activity.create(name: "Maths Tuition", description: "Effective maths coaching for students to improve understanding and performance." , price: "$30/ph" , max_capacity: "1" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 11)
Activity.create(name: "How To Code 101", description: "Introduction to coding concepts and skills for beginners." , price: "$88" , max_capacity: "5" , availability: "17-04-2023", meeting_location: "Bishan", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 12)


# # Activities for What's Popular Near You
# Activity.create(name: "How to Cycle for Beginners", description: "3-hour beginner-friendly indoor cycling sessions guided by Coach Max Lee with 10 years experience." , price: "$50" , max_capacity: "5" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 1)
# Activity.create(name: "Yoga Flow", description: "Gentle yoga practice with fluid movements and breath awareness." , price: "$8" , max_capacity: "10" , availability: "17-04-2023" , meeting_location: "Woodlands Waterfront Park", minimum_age: "0", policies: "Nil", user_id: 2)
# Activity.create(name: "Organic Soap-making", description: "Create your own handmade soap using natural ingredients and essential oils!" , price: "$80" , max_capacity: "5" , availability: "17-04-2023" , meeting_location: "To be disclosed at Yishun", minimum_age: "0", policies: "Nil", user_id: 3)
# Activity.create(name: "My Grandmother's Chinese Dishes", description: "Learn to cook 3 traditional Peranakan dishes with authentic ingredients in our cozy home. The dishes include Ayam Buah Keluak, Babi Pongteh and Kueh Lapis." , price: "$100" , max_capacity: "5" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Nil", user_id: 4)
# Activity.create(name: "Chinese Tuition", description: "Tailored Chinese language coaching for all orimary levels and ages." , price: "$25/p" , max_capacity: "1" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Nil", user_id: 5)
# Activity.create(name: "Data Analysis 101", description: "Introduction to data analysis concepts and tools for beginners." , price: "$50" , max_capacity: "5" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Nil", user_id: 6)

# # Activities for Browse Other Options
# Activity.create(name: "Basketball for Youth", description: "Fun basketball program for kids to learn and develop skills." , price: "$10" , max_capacity: "10" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 7)
# Activity.create(name: "Art of Bird Watching", description: "Discover the art of birdwatching through guided observation and identification." , price: "$30" , max_capacity: "3" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 8)
# Activity.create(name: "Mahjong with Pros", description: "Learn and play Mahjong with experienced players for all levels." , price: "$60" , max_capacity: "4" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 9)
# Activity.create(name: "Perfume Making Workshop", description: "Create custom scents using high-quality ingredients and expert guidance.", price: "$80" , max_capacity: "4" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 10)
# Activity.create(name: "Maths Tuition", description: "Effective maths coaching for students to improve understanding and performance." , price: "$30/ph" , max_capacity: "1" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 11)
# Activity.create(name: "How To Code 101", description: "Introduction to coding concepts and skills for beginners." , price: "$88" , max_capacity: "5" , availability: "17-04-2023" , meeting_location: "Bishan-Ang Mo Kio Park", minimum_age: "0", policies: "Please inform us for rescheduling in the event you are unwell", user_id: 12)
