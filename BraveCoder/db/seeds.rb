50.times do
  Category.create({
                      title: Faker::Book.title,
                      description: Faker::Lorem.sentence(3)
                  })
end