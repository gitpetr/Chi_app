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
              :presence => { :message => :presense_message },
              :length => { :maximum => 100, :message => :max_length_message }

  validates :description,
              :length   => { :maximum => 2000, :message => :max_lenght_message }
end
