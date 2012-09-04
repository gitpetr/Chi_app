# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Article do
  before(:each) do
    @user = FactoryGirl.create( :user )
    @attr = { :content => "some text is here" }
  end

  describe "DB" do
    it "should create article with valid params" do
      expect do
        @user.articles.create @attr
      end.should change( Article, :count ).by( 1 )
    end
  end

  describe "User-Article association" do
    before(:each){ @article = @user.articles.create @attr }

    it "should have a user attribute" do
      @article.should respond_to( :user )
    end

    it "should have right associated user" do
      @article.user_id.should == @user.id
      @article.user.should == @user
    end
  end

  describe "Validations for" do
    it "content can't be empty" do
      @user.articles.build( @attr.merge( :content => "" ) ).should_not be_valid
    end

    it "content can't have more than 50000 symbols" do
      @user.articles.build( @attr.merge( :content => "a" * 50001 ) ).should_not be_valid
    end
  end
end
