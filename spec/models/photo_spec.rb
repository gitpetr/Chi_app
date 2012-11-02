require 'spec_helper'

#TODO: add test to check extensions of file.
describe Photo do
  before(:each){ @attr = { :description => "some text is here", :image => File.open(File.join(Rails.root, '/spec/fixtures/files/violin.jpg')) } }

  describe "DB" do
    it "should create with valid params" do
      expect do
        Photo.create( @attr )
      end.to change( Photo, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "description can be empty" do
      Photo.new( @attr.merge( :description => "" ) ).should be_valid
    end

    it "description can't contain more than 500 symbols" do
      Photo.new( @attr.merge( :description => "a" * 501 ) ).should_not be_valid
    end

    it "image can't have empty path" do
      Photo.new( @attr.merge( :image => "" ) ).should_not be_valid
    end
  end
end
