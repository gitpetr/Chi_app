# encoding: UTF-8
namespace :db do
  desc "Fill database with admin user"
  task :create_admin => :environment do
    make_admin
  end
end

def make_admin
  admin = User.new( :email => "qwerty@qwerty.com", :password => "qwerty" )
  admin.admin = true
  admin.save!
end