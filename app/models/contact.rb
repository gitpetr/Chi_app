class Contact < ActiveRecord::Base
  attr_accessible :address, :chirch_name, :google_map, :phone

  validates :chirch_name,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 200, :message => :max_length_message }
end
