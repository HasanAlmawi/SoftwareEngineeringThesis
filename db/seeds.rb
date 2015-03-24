# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


admin = User.create!(name: "Alex Payne", email: "apayne27@gmail.com", password: "foobar", password_confirmation: "foobar")
admin.toggle!(:admin)
99.times do |n|
	name = Faker::Name.name
	email = "example-#{n+1}@random.org"
	password = "password"
	User.create!(name: name, email: email, password: password, password_confirmation: password)
end
Event.create!(title: "Social Guidelines", lecturer: "Fai Kenayem", code: "ABC", description: "A guide to making friends and influencing people.", start_time: "10/3/2015 12:00:00 AM", end_time: "10/3/2015 12:00:00 AM")
#Event.create!(title: "Guide to Getting Facebook Likes", lecturer: "Hasan Almawi", code: "BSB")
