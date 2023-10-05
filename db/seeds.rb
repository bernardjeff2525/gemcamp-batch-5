5.times do
  Category.create(name: Faker::ProgrammingLanguage.name)
end

50.times do |i|
  post = Post.new
  post.title = Faker::Lorem.sentence
  post.content = Faker::Lorem.paragraph(sentence_count: 4)
  post.categories << Category.all.sample
  post.save

  10.times do
    post.comments.create(content: Faker::Lorem.paragraph(sentence_count: 4))
  end
end
