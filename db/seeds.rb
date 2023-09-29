100.times do |i|
  Post.create(title: "numbered post #{i}", content: "numbered post content #{i}")
end
