# == Schema Information
#
# Table name: welcome_messages
#
#  id         :integer          not null, primary key
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe WelcomeMessage do
  before(:each) do
    @message = FactoryGirl.create( :welcome_message )
    @attr = { :content => "data" }
  end

  describe "DB" do
    it "should create message with valid params" do
      expect do
        WelcomeMessage.create( @attr )
      end.to change( WelcomeMessage, :count ).by( 1 )
    end

    it "should not create message with invalid params" do
      expect do
        WelcomeMessage.create( @attr.merge :content => "" )
      end.to_not change( WelcomeMessage, :count )
    end
  end

  describe "Validations for" do
    it "content can't be empty" do
      message = WelcomeMessage.create( @attr.merge :content => "" )
      message.should_not be_valid
    end

    it "content can't have more than 5000 symbols" do
      message =WelcomeMessage.new( @attr.merge( :content => "a" * 5001 ) )
      message.should_not be_valid
    end
  end
end
