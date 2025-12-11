# db/seeds/production.rb

should_seed = ActiveModel::Type::Boolean.new.cast(ENV.fetch("SEED_PRODUCTION", false))

if !should_seed
  puts "SEED_PRODUCTION is false or not set — skipping production seeds."
  return
end

puts "Running production seeds..."

admin_email    = ENV.fetch("ADMIN_EMAIL", "admin@jasonmag.com")
admin_password = ENV.fetch("ADMIN_PASSWORD") do
  raise "ADMIN_PASSWORD must be set when SEED_PRODUCTION=true"
end

admin = User.find_or_create_by!(email: admin_email) do |user|
  user.password              = admin_password
  user.password_confirmation = admin_password

  user.admin        = true if user.respond_to?(:admin=)
  user.super_admin  = true if user.respond_to?(:super_admin=)
  user.confirmed_at = Time.current if user.respond_to?(:confirmed_at=)
end

puts "Production admin ensured: #{admin.email}"
puts "Password: (redacted)"
