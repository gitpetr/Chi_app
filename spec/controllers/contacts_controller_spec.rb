require 'spec_helper'

describe ContactsController do
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

  describe "GET 'edit'" do
    before(:each){ @contact = FactoryGirl.create(:contact) }

    describe "for non-signed users" do
      it "should access" do
        get :edit, :locale => :en, :id => @contact
        response.should_not be_success
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should not access" do
        get :edit, :locale => :en, :id => @contact
        response.should_not be_success
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :edit, :locale => :en, :id => @contact
        response.should be_success
      end
    end
  end
end
