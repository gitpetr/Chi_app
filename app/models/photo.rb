class Photo < ActiveRecord::Base
  attr_accessible :description, :image

  mount_uploader :image, ImageUploader

  validates :description, :length => { :maximum => 500, :message => :max_lenght_message }
  validates :image, :presence   => { :message => :presence_message }
end
