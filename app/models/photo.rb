class Photo < ActiveRecord::Base
  attr_accessible :description

  validates :description, :length => { :maximum => 500, :message => :max_lenght_message }
end
