require 'spec_helper'

describe ContactsController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user) { FactoryGirl.create( :user ) }

  describe "GET 'index'" do
    shared_examples "contact-index-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "contact-index-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "contact-index-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "contact-index-render-success"
    end
  end

  describe "GET 'edit'" do
    let(:contact) { FactoryGirl.create(:contact) }

    shared_examples "contact-edit-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "contact-edit-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not access" do
        get :edit, locale: :en, id: contact
        response.should_not be_success
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "contact-edit-render-success"
    end
  end

  describe "PUT 'update'" do
    let(:contact) { FactoryGirl.create(:contact) }
    let(:attrs) { { chirch_name: "Here is the name",
                    phone: "+7 (499) 973-10-81",
                    address: "Here is the address",
                    latitude: "55",
                    longitude: "37" } }

    describe "for non-signed users" do
      it "should deny access" do
        put :update, locale: :en, id: contact, contact: attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not update" do
        put :update, locale: :en, id: contact, contact: attrs
        contact.reload
        contact.chirch_name.should_not == attrs[:chirch_name]
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should update" do
        put :update, locale: :en, id: contact, contact: attrs
        contact.reload
        contact.chirch_name.should == attrs[:chirch_name]
      end
    end
  end
end
