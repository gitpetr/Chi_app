# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  album_id    :integer
#

class Photo < ActiveRecord::Base
  belongs_to :album

  attr_accessible :description, :image

  mount_uploader :image, ImageUploader

  validates :description, length: { maximum: 500 }
  validates :image, presence: true
  validates :album_id, presence: true
end
