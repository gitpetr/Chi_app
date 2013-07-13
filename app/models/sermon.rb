# == Schema Information
#
# Table name: sermons
#
#  id            :integer          not null, primary key
#  title         :string(255)      default(""), not null
#  recorded_date :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  record        :string(255)
#

class Sermon < ActiveRecord::Base
  attr_accessible :recorded_date, :title

  validates :title,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 250, :message => :max_length_message }
end
