class Contact < ActiveRecord::Base
  attr_accessible :address, :chirch_name, :google_map, :phone

  validates :chirch_name,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 200, :message => :max_length_message }

  validates :address,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 500, :message => :max_length_message }

  validates :google_map,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 5000, :message => :max_length_message }

  validates :phone,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 100, :message => :max_length_message }
end
