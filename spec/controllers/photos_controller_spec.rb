require 'spec_helper'

describe PhotosController do
  render_views

  before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'index'" do
    before(:each) do
      @album = FactoryGirl.create( :album )
    end

    shared_examples "photo-render-success" do
      it "should access" do
        get :index, :locale => :en, :album_id => @album
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "photo-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "photo-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "photo-render-success"
    end
  end

  describe "GET 'new'" do
    before(:each) do
      @album = FactoryGirl.create( :album )
    end

    shared_examples "photo-deny-access" do
      it "should deny access" do
        get :new, :locale => :en, :album_id => @album
        response.should_not be_success
      end
    end

    describe "for non-signed users" do
      include_examples "photo-deny-access"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "photo-deny-access"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :new, :locale => :en, :album_id => @album
        response.should be_success
      end
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @album = FactoryGirl.create( :album )
      @attrs = { :image => [ fixture_file_upload('/files/violin.jpg', 'image/jpg') ] }
    end

    shared_examples "photo-deny-access-and-not-create" do
      it "should deny access" do
        post :create, :locale => :en, :album_id => @album, :photo => @attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, :locale => :en, :album_id => @album, :photo => @attrs
        end.to_not change( Photo, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "photo-deny-access-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "photo-deny-access-and-not-create"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should create" do
        expect do
          post :create, :locale => :en, :album_id => @album, :photo => @attrs
        end.to change( Photo, :count ).by(1)
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @photo = FactoryGirl.create(:photo)
      @album = @photo.album
    end

    shared_examples "photo-edit-deny-access" do
      it "should deny access" do
        get :edit, :locale => :en, :album_id => @album, :id => @photo
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "photo-edit-deny-access"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "photo-edit-deny-access"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :edit, :locale => :en, :album_id => @album, :id => @photo
        response.should be_success
      end
    end
  end

  describe "PUT 'update'" do
    before(:each) do
      @photo = FactoryGirl.create(:photo)
      @album = @photo.album
      @attrs = { :description => "12345" }
    end

    describe "for non-signed users" do
      it "should deny access" do
        put :update, :locale => :en, :album_id => @album, :id => @photo, :photo => @attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should not update" do
        put :update, :locale => :en, :album_id => @album, :id => @photo, :photo => @attrs
        @photo.reload
        @photo.description.should_not  == @attrs[:description]
      end
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( @admin ) }

      it "should update" do
        put :update, :locale => :en, :album_id => @album, :id => @photo, :photo => @attrs
        @photo.reload
        @photo.description.should  == @attrs[:description]
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @photo = FactoryGirl.create(:photo)
      @album = @photo.album
    end

    shared_examples "photo-destroy-deny-access-and-not-create" do
      it "should deny access" do
        delete :destroy, :locale => :en, :album_id => @album, :id => @photo
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, :locale => :en, :album_id => @album, :id => @photo
        end.to_not change( Photo, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "photo-destroy-deny-access-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "photo-destroy-deny-access-and-not-create"
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( @admin ) }

      it "should delete" do
        expect do
          delete :destroy, :locale => :en, :album_id => @album, :id => @photo
        end.to change( Photo, :count ).by(-1)
      end
    end
  end
end
