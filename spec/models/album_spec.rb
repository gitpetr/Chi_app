# == Schema Information
#
# Table name: albums
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'spec_helper'

describe Album do
  before(:each) do
    @user = FactoryGirl.create( :user )
    @attr = { :name => "Test title", :description => "some text is here" }
  end

  describe "DB" do
    it "should create album with valid params" do
      expect do
        @user.albums.create @attr
      end.to change( Album, :count ).by( 1 )
    end
  end

  describe "User-Album association" do
    before(:each){ @album = @user.albums.create @attr }

    it "should have a user attribute" do
      @album.should respond_to( :user )
    end

    it "should have right associated user" do
      @album.user_id.should == @user.id
      @album.user.should == @user
    end
  end

  describe "Validations for" do
    it "name can't be empty" do
      @user.albums.build( @attr.merge( :name => "" ) ).should_not be_valid
    end

    it "description can't be empty" do
      @user.albums.build( @attr.merge( :description => "" ) ).should_not be_valid
    end

    it "description can't have more than 2000 symbols" do
      @user.albums.build( @attr.merge( :description => "a" * 2001 ) ).should_not be_valid
    end

    it "name can't have more than 100 symbols" do
      @user.albums.build( @attr.merge( :name => "a" * 101 ) ).should_not be_valid
    end
  end
end
