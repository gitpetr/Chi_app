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
  # before(:each){ @attr = { :content => "some text is here" } }
  # 
  # describe "Validations for" do
  #   it "content can't be empty" do
  #     article = Article.create( @attr.merge :content => "" )
  #     article.should_not be_valid
  #   end
  # end
end
