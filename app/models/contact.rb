# encoding: UTF-8
class Contact < ActiveRecord::Base
  acts_as_gmappable

  attr_accessible :address, :chirch_name, :phone, :latitude, :longitude, :gmaps

  validates :chirch_name,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 200, :message => :max_length_message }

  validates :address,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 500, :message => :max_length_message }

  validates :phone,
              :presence => { :message => :presense_message },
              :length   => { :maximum => 100, :message => :max_length_message }

  def gmaps4rails_address
    # Describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki.
    "#{self.street}, #{self.city}, #{self.country}"
  end
end