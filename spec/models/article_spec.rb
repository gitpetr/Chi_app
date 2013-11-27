# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  content    :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  title      :string(255)      not null
#

require 'spec_helper'

describe Article do
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:title).is_at_most(100) }
  it { should ensure_length_of(:content).is_at_most(50000) }

  describe "DB" do
    it "should create article with valid params" do
      user = FactoryGirl.create( :user )
      attrs = { :content => "some text is here", :title => "Test title" }

      expect do
        user.articles.create attrs
      end.to change( Article, :count ).by( 1 )
    end
  end
end
