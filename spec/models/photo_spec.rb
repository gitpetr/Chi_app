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

  describe "Image's format" do
    it "should allow to save jpg, jpeg, gif, png" do
      images = ["cello.jpg", "cello.jpeg", "cello.gif", "cello.png"]
      images.each do |i|
        FactoryGirl.build(:photo, image: File.open(File.join(Rails.root, "/spec/fixtures/files/#{i}"))).should be_valid
      end
    end

    it "should not allow to save anything (such is mp3, mp4) except extensions in white list" do
      files = ["record.mp3", "record.mp4"]
      files.each do |f|
        FactoryGirl.build(:photo, image: File.open(File.join(Rails.root, "/spec/fixtures/files/#{f}"))).should_not be_valid
      end
    end
  end
end
