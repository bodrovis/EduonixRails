# 50.times do
#   Category.create({
#                       title: Faker::Book.title,
#                       description: Faker::Lorem.sentence(3)
#                   })
# end

Event.find_each do |event|
  unless event.owner.present?
    event.owner = User.last
    event.save!
  end
end