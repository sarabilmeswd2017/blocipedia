require 'random_data'
require 'faker'

u = User.create(
name: 'joe user',
email: 'joe@user.com',
password: 'password',
confirmed_at: Time.now
)

15.times do
  User.create!(
  name: Faker::Name.name,
  email: Faker::Internet.email,
  password: Faker::Internet.password,
  #confirmed_at: Faker::DateTime.dateTime($max = 'now', $timezone = date_default_timezone_get())
  confirmed_at: Time.now
  )
end
users = User.all


# Create Wikis
# 50.times do
# # #1
#   Wiki.create!(
# # #2
#     title:  RandomData.random_sentence,
#     body:   RandomData.random_paragraph,
#     private: false,
#     user: u
#   )
# end
# wikis = Wiki.all


50.times do
  # #1
  Wiki.create!(
  title:  Faker::Name.title,
  body:   Faker::Lorem.paragraph,
  private: false

  )
end
wikis = Wiki.all

puts "Seed finished"
puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
