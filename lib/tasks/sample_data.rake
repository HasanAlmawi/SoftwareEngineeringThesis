namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		admin = User.create!(name: "Alex Payne", email: "apayne27@gmail.com", password: "foobar", password_confirmation: "foobar")
		admin.toggle!(:admin)
		99.times do |n|
			name = Faker::Name.name
			email = "example-#{n+1}@random.org"
			password = "password"
			User.create!(name: name, email: email, password: password, password_confirmation: password)
		end
		Event.create!(title: "Example", lecturer: "Fai Kenayem", code: "ABC")
		Event.create!(title: "Guide to Getting Facebook Likes", lecturer: "Hasan Almawi", code: "BSB")
	end
end