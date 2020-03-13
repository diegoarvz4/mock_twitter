# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do |index|

  User.create do |user|
    user.username = Faker::Twitter.screen_name
  end

  Tweet.create do |tweet|
    tweet.content = Faker::FunnyName.name
    tweet.author_id = index
  end

end