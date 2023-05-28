# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

30.times do
  item = Item.create(title: Faker::Alphanumeric.alpha(number: 50), url: "https://equalitytime.github.io/FlowersForTuring/", text: "", score: rand(100))
  rand(10).times do
    comment = item.comments.create!(text: Faker::Alphanumeric.alpha(number: 100))
  end

  # item.comments.each do |comment|
  #   comment.replies.create!(text: Faker::Alphanumeric.alpha(number: 100))
  # end

end

puts "已创建 30 条记录。"