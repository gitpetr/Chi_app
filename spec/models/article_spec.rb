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

  describe "Validations for" do
    it "content can't be empty" do
      @user.articles.build( @attr.merge( :content => "" ) ).should_not be_valid
    end
  end
end
