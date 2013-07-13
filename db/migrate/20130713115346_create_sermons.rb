class CreateSermons < ActiveRecord::Migration
  def change
    create_table :sermons do |t|
      t.string 	 :title, :null => false, :default => ""
      t.datetime :recorded_date

      t.timestamps
    end
  end
end
