# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Create user
10.times do
  user = User.new
  user.name = Faker::Internet.user_name
  user.email = Faker::Internet.email
  user.password = Faker::Internet.password(8)
  user.save
end

# Create 50 links
50.times do |i|
  userId = (i+1) % 10
  link = Link.new
  link.title = Faker::Company.catch_phrase
  link.url = Faker::Internet.url
  if userId == 0
    userId = 10
  end
  link.user_id = userId
  link.save
end
