class AddRecordToSermons < ActiveRecord::Migration
  def change
    add_column :sermons, :record, :string
  end
end
