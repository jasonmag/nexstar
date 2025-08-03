# db/seeds/articles.rb

Article.destroy_all

5.times do |i|
  Article.create!(
    title: "Sample Article #{i + 1}",
    content: "This is the body of sample article #{i + 1}. Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
    slug: "sample-article-#{i + 1}",
    published_at: i < 4 ? Time.current - (5 - i).days : nil
  )
end

puts "Seeded articles"
