# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  admin                  :boolean          default(FALSE)
#

require 'spec_helper'

describe User do
  let(:attrs) { {email: "qwerty@qwerty.com", password: "qwertyqwerty"} }

  it { should have_many(:articles) }
  it { should have_many(:albums) }
  it { should have_many(:sermons) }

  describe "DB" do
    it "should create user with valid params" do
      expect do
        user = User.create( attrs )
      end.to change( User, :count ).by( 1 )
    end
  end

  describe "Validations" do
    it "admin's attribute should be false when user has been created" do
      user = User.create( attrs )
      user.admin.should be_false
    end
  end
end
