# encoding: UTF-8
# == Schema Information
#
# Table name: contacts
#
#  id          :integer          not null, primary key
#  chirch_name :string(255)
#  address     :text
#  phone       :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  latitude    :float
#  longitude   :float
#  gmaps       :boolean          default(TRUE)
#

class Contact < ActiveRecord::Base
  acts_as_gmappable

  attr_accessible :address, :chirch_name, :phone, :latitude, :longitude, :gmaps

  validates :chirch_name,
              presence: true,
              length: { maximum: 200 }

  validates :address,
              presence: true,
              length: { maximum: 500 }

  validates :phone,
              presence: true,
              length: { maximum: 100 }
end
