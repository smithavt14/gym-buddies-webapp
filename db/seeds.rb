# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




max_participants = (5..20).to_a

Workout.delete_all
puts "Deleted all the workouts"

15.times do
  Workout.create(
    name: Faker::Cannabis.strain,
    description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Natus autem aliquam fugit eveniet accusamus eaque excepturi adipisci error velit facilis dolores, debitis sint aperiam cumque quod recusandae necessitatibus ipsum repudiandae?",
    location: Faker::Address.community,
    max_participants: max_participants.sample,
    time: Faker::Time.forward(23, :morning),
    user:
  )
end

puts "Created #{Workout.count} workouts"
