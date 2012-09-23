require 'spec_helper'

describe PhotosController do
  render_views

  before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'index'" do
    describe "for non-signed users" do
      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end
  end
end
