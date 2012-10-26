class AddGeoDataOfChirch < ActiveRecord::Migration
  def up
    Contact.first.update_attributes( :longitude => 37.590744, :latitude => 55.793996 )
  end

  def down
    Contact.delete_all
  end
end
