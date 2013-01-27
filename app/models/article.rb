# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)      not null
#

class Article < ActiveRecord::Base
  belongs_to :user

  attr_accessible :title, :content

  validates :content,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 50000, :message => :max_lenght_message }
  validates :title,
              :presence => { :message => :presense_message },
              :length => { :maximum => 100, :message => :max_length_message }

end
