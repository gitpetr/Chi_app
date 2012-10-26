class RemoveGoogleMapFromContacts < ActiveRecord::Migration
  def up
    remove_column :contacts, :google_map
  end

  def down
    add_column :contacts, :google_map, :string
  end
end
