require 'spec_helper'

describe StatsController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user)  { FactoryGirl.create( :user ) }

  describe "GET 'users_in_system'" do
    shared_examples "stats-users_in_system-deny-access" do
      it "should access" do
        get :users_in_system, locale: :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "stats-users_in_system-deny-access"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "stats-users_in_system-deny-access"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :users_in_system, locale: :en
        response.should be_success
      end
    end
  end
end
