# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "deleting bookings..."

Booking.delete_all if Rails.env.development?

puts "deleting workouts..."

Workout.delete_all if Rails.env.development?

puts "deleting users..."

User.delete_all if Rails.env.development?


User.create(first_name: "test_user_first", last_name: "test_user_last", location: "Shanghai", email: "test@gmail.com", password: "123123")
puts "Created #{User.count} users"

max_participants = (5..20).to_a

Workout.delete_all
puts "Deleted all the workouts"

collection = ["Bodyweight", "Weighted", "Gymnastics", "Yoga", "Group", "Outdoor", "Indoor", "Advanced", "Intermediate", "Beginner"]

15.times do
  workout = Workout.new(
    name: Faker::Cannabis.strain,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus autem aliquam fugit eveniet accusamus eaque excepturi adipisci error velit facilis dolores, debitis sint aperiam cumque quod recusandae necessitatibus ipsum repudiandae?",
    location: Faker::Address.city,
    max_participants: max_participants.sample,
    time: Faker::Time.forward(23, :morning),
    user: User.last
  )
  workout.tag_list.add(collection.sample)
  workout.tag_list.add(collection.sample)
  workout.tag_list.add(collection.sample)
  workout.save
end

puts "Created #{Workout.count} workouts"
