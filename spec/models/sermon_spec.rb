# == Schema Information
#
# Table name: sermons
#
#  id            :integer          not null, primary key
#  title         :string(255)      default(""), not null
#  recorded_date :datetime
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  record        :string(255)
#  preacher      :string(255)
#  user_id       :integer
#

require 'spec_helper'

describe Sermon do
  it { should belong_to(:user) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(250) }
  it { should validate_presence_of(:record) }
  it { should validate_presence_of(:preacher) }
  it { should validate_presence_of(:recorded_date) }

  describe "DB" do
    it "should create sermon with valid params" do
      user = FactoryGirl.create( :user )

      expect do
        user.sermons.create( title: "qwerty@qwerty.com",
                             recorded_date: DateTime.now,
                             preacher: "name",
                             record: File.open(File.join(Rails.root, '/spec/fixtures/files/record.mp3')) )
      end.to change( Sermon, :count ).by( 1 )
    end
  end

  describe "Methods" do
    it "should return path to the record" do
      sermon = FactoryGirl.create(:sermon)
      sermon_name = sermon.record.file.identifier.split(".").first

      sermon.record_player_path.should == "/uploads/sermon/record/#{sermon.id}/#{sermon_name}.mp3"
    end
  end

  describe "Record's format" do
    it "should not allow anything other formats, such as mp4 or jpg" do
      records = ['record.mp4', 'cello.jpg']

      records.each do |r|
        FactoryGirl.build(:sermon, record: File.open(File.join(Rails.root, "/spec/fixtures/files/#{r}"))).should_not be_valid
      end
    end
  end
end
