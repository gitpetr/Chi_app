# == Schema Information
#
# Table name: photos
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image       :string(255)
#  album_id    :integer
#

require 'spec_helper'

#TODO: add test to check extensions of file.
describe Photo do
  it { should belong_to(:album) }
  it { should validate_presence_of(:image) }
  it { should ensure_length_of(:description).is_at_most(500) }

  describe "DB" do
    it "should create with valid params" do
      attrs = { description: "some text is here",
                image: File.open(File.join(Rails.root, '/spec/fixtures/files/violin.jpg')) }

      expect do
        Photo.create( attrs )
      end.to change( Photo, :count ).by( 1 )
    end
  end
end
