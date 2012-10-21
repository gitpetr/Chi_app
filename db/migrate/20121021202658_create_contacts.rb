class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :chirch_name
      t.text :address
      t.string :phone
      t.text :google_map

      t.timestamps
    end
  end
end
