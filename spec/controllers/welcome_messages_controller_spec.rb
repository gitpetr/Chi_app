require 'spec_helper'

describe WelcomeMessagesController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user)  { FactoryGirl.create( :user ) }

  describe "GET 'edit'" do
    let(:welcome_message) { FactoryGirl.create(:welcome_message) }

    shared_examples "welcome_message-edit-redirect-to-root" do
      it "should deny access" do
        get :edit, locale: :en, id: welcome_message
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "welcome_message-edit-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "welcome_message-edit-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :edit, locale: :en, id: welcome_message
        response.should be_success
      end
    end
  end

  describe "PUT 'update'" do
    let(:welcome_message) { FactoryGirl.create(:welcome_message) }
    let(:attrs) { {content: "some"} }

    describe "for non-signed users" do
      it "should deny access" do
        put :update, locale: :en, id: welcome_message, welcome_message: attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not update" do
        put :update, locale: :en, id: welcome_message, welcome_message: attrs
        welcome_message.reload
        welcome_message.content.should_not == attrs[:content]
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should update" do
        put :update, locale: :en, id: welcome_message, welcome_message: attrs
        welcome_message.reload
        welcome_message.content.should == attrs[:content]
      end
    end
  end
end
