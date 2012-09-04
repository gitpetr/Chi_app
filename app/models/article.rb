# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Article < ActiveRecord::Base
  # attr_accessible :title, :body
end
