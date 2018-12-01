# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.find_or_create_by!(email: 'admin@example.com') do |user|
  user.name = 'admin'
  user.admin = true
  user.password = 'password'
  user.password_confirmation = 'password'
end

User.find_or_create_by!(email: 'user@example.com') do |user|
  user.name = 'user'
  user.admin = false
  user.password = 'password'
  user.password_confirmation = 'password'
end

Task.create!(
  name: 'Task for admin.',
  description: 'Task created by admin user using seed. Lets see if this works',
  user_id: User.find_by(name: 'admin').id
)

Task.create!(
  name: 'Task for regular user',
  description: 'Task created by regular user (non-admin) using seed. Hope this works',
  user_id: User.find_by(name: 'user').id
)
