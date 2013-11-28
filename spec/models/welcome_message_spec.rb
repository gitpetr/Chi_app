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
  it { should validate_presence_of(:content) }
  it { should ensure_length_of(:content).is_at_most(5000) }

  describe "DB" do
    it "should create message with valid params" do
      attrs = { :content => "data" }

      expect do
        WelcomeMessage.create( attrs )
      end.to change( WelcomeMessage, :count ).by( 1 )
    end
  end
end
