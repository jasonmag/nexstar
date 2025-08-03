# db/seeds/projects.rb

Project.destroy_all

5.times do |i|
  Project.create!(
    name: "Sample Project #{i + 1}",
    description: "Description for Sample Project #{i + 1}. Built with Ruby on Rails and TailwindCSS.",
    tech_stack: "Ruby on Rails, TailwindCSS, PostgreSQL",
    url: "https://example.com/project-#{i + 1}",
    github_url: "https://github.com/jasonmag/project-#{i + 1}",
    released_on: Date.today - (i * 30)
  )
end

puts "Seeded projects"
