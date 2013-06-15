# == Schema Information
#
# Table name: welcome_messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WelcomeMessage < ActiveRecord::Base
  attr_accessible :content

  validates :content,
              :presence => { :message => "should exist" },
              :length   => { :maximum => 5000, :message => "should be < 5000" }
end
