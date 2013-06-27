# encoding: UTF-8
class AddWelcomeMessage < ActiveRecord::Migration
  def up
    WelcomeMessage.create( :content => "Добро пожаловать на наш сайт!" )
  end

  def down
    WelcomeMessage.delete_all
  end
end
