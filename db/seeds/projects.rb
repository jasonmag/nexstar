# db/seeds/projects.rb

Project.destroy_all

sample_images = [
  "https://images.unsplash.com/photo-1521737604893-d14cc237f11d",
  "https://images.unsplash.com/photo-1518770660439-4636190af475",
  "https://images.unsplash.com/photo-1498050108023-c5249f4df085",
  "https://images.unsplash.com/photo-1519389950473-47ba0277781c?auto=format&fit=crop&w=1200&q=80",
  "https://images.unsplash.com/photo-1504384308090-c894fdcc538d"
]

5.times do |i|
  Project.create!(
    name: "Sample Project #{i + 1}",
    description: "Description for Sample Project #{i + 1}. Built with Ruby on Rails and TailwindCSS.",
    tech_stack: "Ruby on Rails, TailwindCSS, PostgreSQL",
    url: "https://example.com/project-#{i + 1}",
    github_url: "https://github.com/jasonmag/project-#{i + 1}",
    released_on: Date.today - (i * 30),
    image_url: sample_images[i] # ✅ Image URL added
  )
end

puts "✅ Seeded projects"
