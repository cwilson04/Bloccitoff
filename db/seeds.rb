require 'random_data'

2.times do |i|
  user = User.new(email: "user#{i}@example.com", password: "password")
  user.skip_confirmation!
  user.save!
end

users = User.all
 # Create list items
 10.times do
   Item.create!(
     description:  RandomData.random_sentence,
     user: users.sample,
     completed: [true, false].sample
   )
 end

 
 puts "Seed finished"
 puts "#{User.count} users created"
 puts "#{Item.count} to do items created"
