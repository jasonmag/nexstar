# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

if Rails.env.development?
    load(Rails.root.join("db/seeds/development.rb")) 
    load(Rails.root.join("db/seeds/articles.rb"))
    load(Rails.root.join("db/seeds/projects.rb"))
    load(Rails.root.join("db/seeds/about.rb"))
end

if Rails.env.production?
  load(Rails.root.join("db/seeds/production.rb"))
end
