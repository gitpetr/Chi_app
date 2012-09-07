require 'spec_helper'

describe StatsController do
  render_views

  before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'users_in_system'" do
    describe "for non-signed users" do
      it "should deny access" do
        get :users_in_system, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        get :users_in_system, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :users_in_system, :locale => :en
        response.should be_success
      end
    end
  end
end
