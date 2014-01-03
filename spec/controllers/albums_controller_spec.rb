require 'spec_helper'

describe AlbumsController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user) { FactoryGirl.create( :user ) }

  describe "GET 'index'" do
    shared_examples "album-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "album-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "album-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "album-render-success"
    end
  end

  describe "GET 'new'" do
    shared_examples "album-redirect-to-root" do
      it "should deny access" do
        get :new, locale: :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "album-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "album-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :new, locale: :en
        response.should be_success
      end
    end
  end

  describe "POST 'create'" do
    let(:attrs) { {name: "name", description: ""} }

    shared_examples "album-redirect-to-root-and-not-create" do
      it "should deny access" do
        post :create, locale: :en, album: attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, locale: :en, album: attrs
        end.to_not change( Album, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "album-redirect-to-root-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "album-redirect-to-root-and-not-create"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should create" do
        expect do
          post :create, locale: :en, album: attrs
        end.to change( Album, :count ).by(1)
      end
    end
  end

  describe "GET 'edit'" do
    let(:album) { FactoryGirl.create(:album) }

    shared_examples "album-edit-redirect-to-root" do
      it "should deny access" do
        get :edit, locale: :en, id: album
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "album-edit-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "album-edit-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :edit, locale: :en, id: album
        response.should be_success
      end
    end
  end

  describe "PUT 'update" do
    let(:album) { FactoryGirl.create(:album) }
    let(:attrs) { {name: "name2", description: ""} }

    describe "for non-signed users" do
      it "should deny access" do
        put :update, locale: :en, id: album, album: attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not update" do
        put :update, locale: :en, id: album, album: attrs
        album.reload
        album.name.should_not == attrs[:name]
      end
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( admin ) }

      it "should update" do
        put :update, locale: :en, id: album, album: attrs
        album.reload
        album.name.should == attrs[:name]
      end
    end
  end

  describe "DELETE 'destroy'" do
    let!(:album) { FactoryGirl.create(:album) }

    shared_examples "album-redirect-to-root-and-not-delete" do
      it "should deny access" do
        delete :destroy, locale: :en, id: album
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, locale: :en, id: album
        end.to_not change( Album, :count )
      end
    end

    describe "for non-signed users" do
      include_examples 'album-redirect-to-root-and-not-delete'
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples 'album-redirect-to-root-and-not-delete'
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( admin ) }

      it "should delete" do
        expect do
          delete :destroy, locale: :en, id: album
        end.to change(Album, :count).by(-1)
      end
    end
  end
end
