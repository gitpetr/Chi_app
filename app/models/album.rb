# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Album < ActiveRecord::Base
  belongs_to :user
  has_many   :photos

  attr_accessible :description, :name

  validates :name,
              presence: true,
              length: { maximum: 100 }

  validates :description,
              length: { maximum: 2000 }
end
