class AddPreacherToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :preacher, :string
  end
end
