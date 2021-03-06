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

class Sermon < ActiveRecord::Base
  belongs_to :user

  attr_accessible :recorded_date, :title, :preacher, :record

	mount_uploader :record, RecordUploader

  validates :title, presence: true, length: { maximum: 250 }
  validates :record, presence: true
  validates :preacher, presence: true
  validates :recorded_date, presence: true
  validates :user_id, presence: true

  # Path to record for audio player.
  def record_player_path
  	self.record.file.path.split("/public").last
  end
end
