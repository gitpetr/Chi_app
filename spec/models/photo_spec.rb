require 'spec_helper'

describe Photo do
  before(:each){ @attr = { :description => "some text is here" } }

  describe "DB" do
    it "should create with valid params" do
      expect do
        Photo.create( @attr )
      end.should change( Photo, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "description can be empty" do
      Photo.new( @attr.merge( :description => "" ) ).should be_valid
    end

    it "description can't contain more than 500 symbols" do
      Photo.new( @attr.merge( :description => "a" * 501 ) ).should_not be_valid
    end
  end
end
