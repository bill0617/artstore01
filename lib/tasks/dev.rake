namespace :dev do
  desc "admin_user_created"
  task :admin => :environment do
    u = User.new
    u.email = "admin@test.com"
    u.password = "12345678"
    u.password_confirmation = "12345678"
    u.is_admin = true
    u.save
  end
end
