require 'spec_helper'

describe HomesController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user)  { FactoryGirl.create( :user ) }

  describe "GET 'index'" do
    shared_examples "home-index-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "home-index-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "home-index-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "home-index-render-success"
    end
  end
end
