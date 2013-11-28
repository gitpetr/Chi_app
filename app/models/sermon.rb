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

# TODO: belongs to user.
class Sermon < ActiveRecord::Base
  attr_accessible :recorded_date, :title, :preacher, :record

	mount_uploader :record, RecordUploader

  validates :title, presence: true, length: { maximum: 250 }
  validates :record, presence: true
  validates :preacher, presence: true
  validates :recorded_date, presence: true

  # Path to record for audio player.
  def record_player_path
  	if !self.nil?
  		self.record.file.path.split("/public").last
  	else
  		nil
  	end
  end
end
