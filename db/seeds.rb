# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


if Rails.env.development?
	admin = User.create!(name: "Alex Payne", email: "apayne27@gmail.com", password: "foobar", password_confirmation: "foobar")
	admin.toggle!(:admin)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@random.org"
		password = "password"
		User.create!(name: name, email: email, password: password, password_confirmation: password)
	end
	Event.create!(title: "Social Guidelines", lecturer: "Fai Kenayem", code: "ABC", description: "A guide to making friends and influencing people.", start_time: "10/3/2015 12:00:00 AM", end_time: "10/3/2015 12:00:00 AM")
	Event.create!(title: "Guide to getting Facebook likes", lecturer: "Hasan Almawi", code: "FBL", description: "How to be the coolest person amongst all you friends.", start_time: "26/3/2015 1:30:00 PM", end_time: "26/3/2015 2:30:00 PM")
	Event.create!(title: "Ruby on Rails coding session", lecturer: "Alex Payne", code: "ROR", description: "A guide to coding in Ruby on Rails.", start_time: "21/3/2015 9:00:00 PM", end_time: "23/3/2015 9:00:00 PM")
end

if Rails.env.production?
	admin = User.create!(name: "Alex Payne", email: "apayne27@gmail.com", password: "foobar", password_confirmation: "foobar")
	admin.toggle!(:admin)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@random.org"
		password = "password"
		User.create!(name: name, email: email, password: password, password_confirmation: password)
	end
	Event.create!(title: "Social Guidelines", lecturer: "Fai Kenayem", code: "ABC", description: "A guide to making friends and influencing people.", start_time: "10/3/2015 12:00:00 AM", end_time: "10/3/2015 12:00:00 AM")
end
