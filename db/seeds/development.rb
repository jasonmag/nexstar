
# Admin user
User.find_or_create_by!(email: "admin@jasonmag.com") do |user|
  user.password = "admin123"
  user.password_confirmation = "admin123"
  user.admin = true
end

# Regular user
User.find_or_create_by!(email: "user@jasonmag.com") do |user|
  user.password = "user123"
  user.password_confirmation = "user123"
  user.admin = false
end

puts "Seeded initial users"