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
#

require 'spec_helper'

describe Sermon do
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(250) }
  it { should validate_presence_of(:record) }
  it { should validate_presence_of(:preacher) }
  it { should validate_presence_of(:recorded_date) }

  describe "DB" do
    it "should create sermon with valid params" do
      attrs = { title: "qwerty@qwerty.com",
                recorded_date: DateTime.now,
                preacher: "name",
                record: File.open(File.join(Rails.root, '/spec/fixtures/files/record.mp3')) }

      expect do
        Sermon.create( attrs )
      end.to change( Sermon, :count ).by( 1 )
    end
  end
end
