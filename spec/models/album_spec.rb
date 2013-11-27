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
  it { should belong_to(:user) }
  it { should have_many(:photos) }
  it { should validate_presence_of(:name) }
  it { should ensure_length_of(:name).is_at_most(100) }
  it { should ensure_length_of(:description).is_at_most(2000) }

  describe "DB" do
    it "should create album with valid params" do
      user = FactoryGirl.create( :user )
      attrs = { :name => "Test title", :description => "some text is here" }

      expect do
        user.albums.create attrs
      end.to change( Album, :count ).by( 1 )
    end
  end
end
