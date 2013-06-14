# encoding: UTF-8
class AddGeoDataOfChirch < ActiveRecord::Migration
  def up
    Contact.delete_all
    Contact.create( :chirch_name => "Преображение во Христе",
                    :address => "г. Москва, метро Савеловская, ул. Сущевский вал, д.3/5",
                    :phone => "+7 (499) 973-10-81",
                    :latitude => 55.793423,
                    :longitude => 37.590503 )
  end

  def down
    Contact.delete_all
  end
end
