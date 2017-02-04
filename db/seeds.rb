# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
include Faker

100.times do
  Wiki.create!(
  title: Faker::Lorem.sentence,
  body: Faker::Lorem.paragraph,
  private: false,
  user: nil
  )
end
wikis = Wiki.all

50.times do
  user = User.create!(
  email: Faker::Internet.email,
  password: Faker::Internet.password
  )
end

users = User.all


  admin = User.create!(
  email:    'admin@example.com',
  password: 'helloworld',
  role:     'admin'
  )


  member = User.create!(
  email:    'member@example.com',
  password: 'helloworld'
  )


  premium = User.create!(
    email:    'premium@example.com',
    password: 'helloworld',
    role:     'premium'
  )

puts "#{Wiki.count} wikis created"
puts "#{User.count} users created"
