class AddUserIdToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :user_id, :integer
  end
end
