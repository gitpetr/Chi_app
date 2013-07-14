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
  before(:each) do
    @attr = { :title => "qwerty@qwerty.com",
              :recorded_date => DateTime.now,
              :record => File.open(File.join(Rails.root, '/spec/fixtures/files/record.mp3')) }
  end

  describe "DB" do
    it "should create sermon with valid params" do
      expect do
        Sermon.create( @attr )
      end.to change( Sermon, :count ).by( 1 )
    end
  end

  describe "Validations for" do
    it "title can't be empty" do
      Sermon.new( @attr.merge :title => "" ).should_not be_valid
    end

    it "title can't have more than 250 symbols" do
      Sermon.new( @attr.merge( :title => "a" * 251 ) ).should_not be_valid
    end

    it "record can't be empty" do
      Sermon.new( @attr.merge( :record => "" ) ).should_not be_valid
    end
  end
end
