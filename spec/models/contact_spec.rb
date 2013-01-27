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
  before(:each) do
    @attr = { :chirch_name => "Transfiguration", :address => "Moscow", :phone => "12345"}
  end

  describe "DB" do
    it "should create contact with valid params" do
      expect do
        Contact.create @attr
      end.to change( Contact, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "chirch_name can't be empty" do
      Contact.new( @attr.merge( :chirch_name => "" ) ).should_not be_valid
    end

    it "chirch_name can't have more than 200 symbols" do
      Contact.new( @attr.merge( :chirch_name => "a" * 201 ) ).should_not be_valid
    end

    it "address can't be empty" do
      Contact.new( @attr.merge( :address => "" ) ).should_not be_valid
    end

    it "chirch_name can't have more than 200 symbols" do
      Contact.new( @attr.merge( :address => "a" * 501 ) ).should_not be_valid
    end

    it "phone can't be empty" do
      Contact.new( @attr.merge( :phone => "" ) ).should_not be_valid
    end

    it "chirch_name can't have more than 5000 symbols" do
      Contact.new( @attr.merge( :phone => "a" * 101 ) ).should_not be_valid
    end
  end
end
