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

require 'spec_helper'

describe Contact do
  it { should validate_presence_of(:chirch_name) }
  it { should ensure_length_of(:chirch_name).is_at_most(200) }
  it { should validate_presence_of(:address) }
  it { should ensure_length_of(:address).is_at_most(500) }
  it { should validate_presence_of(:phone) }
  it { should ensure_length_of(:phone).is_at_most(100) }

  describe "DB" do
    it "should create contact with valid params" do
      expect do
        Contact.create( chirch_name: "Transfiguration", address: "Moscow", phone: "12345" )
      end.to change( Contact, :count ).by( 1 )
    end
  end
end
