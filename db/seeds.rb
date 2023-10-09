5.times do
  Category.create(name: Faker::ProgrammingLanguage.name)
end

10.times do
  User.create(email: Faker::Internet.email, password: Faker::Alphanumeric.alpha(number: 10))
end

50.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence
  post.content = Faker::Lorem.paragraph(sentence_count: 4)
  post.categories << Category.all.sample
  post.user = User.all.sample
  post.save

  10.times do
    post.comments.create(content: Faker::Lorem.paragraph(sentence_count: 4),
                         user: User.all.sample)
  end
end
