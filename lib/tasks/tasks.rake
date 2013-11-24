# encoding: UTF-8
namespace :db do
  desc "Fill database with test admin user."
  task :create_test_admin => :environment do
    make_test_admin
  end

  desc "Destroy test admin user"
  task :destroy_test_admin => :environment do
    destroy_test_admin
  end

  desc "Create team of maintainers."
  task :create_admins_team => :environment do
    create_admins_team
  end
end

def make_test_admin
  admin = User.new( :email => "qwerty@qwerty.com", :password => "qwertyqwerty" )
  admin.admin = true
  admin.save!
end

def destroy_test_admin
  admin = User.find_by_email "qwerty@qwerty.com"
  admin.destroy unless admin.nil?
end

def create_admins_team
  emails = [ "gelika007@mail.ru", "gelvior@gmail.com", "veragorbatova@yandex.ru", "am.fadin@genser.ru", "Koozya91@gmail.com" ]
  uncreated_users_count = 0

  emails.each do |email|
    user = User.find_by_email email

    if user.nil?                                                                                    # Creating user only if he doesn't already exists in the database.
      password = random_str(20)
      admin = User.new( :email => email, :password => password )
      admin.admin = true

      puts "User created\n  email: #{email}\n  password: #{password}" if admin.save!
    else
      uncreated_users_count += 1
    end
  end

  puts "\nI can't save some users (#{uncreated_users_count}) because they already exists." if uncreated_users_count > 0
end

private
  # Return string with random chars. If size is not set then return string with length == 1.
  # random_str( 2 ) => "XD"
  # random_str => "X"
  def random_str( size=1 )
    (0...size).map{65.+(rand(25)).chr}.join
  end