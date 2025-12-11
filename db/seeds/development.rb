# db/seeds/development.rb
def seed_user(email, password, admin: false)
  User.find_or_create_by!(email: email) do |user|
    user.password = password
    user.password_confirmation = password

    user.admin        = admin if user.respond_to?(:admin=)
    user.super_admin  = admin if user.respond_to?(:super_admin=)
    user.confirmed_at = Time.current if user.respond_to?(:confirmed_at=)
  end
end

seed_user("admin@jasonmag.com", "admin123", admin: true)
seed_user("user@jasonmag.com", "user123", admin: false)

puts "Seeded initial users"
