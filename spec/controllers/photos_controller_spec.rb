require 'spec_helper'

describe PhotosController do
  render_views

  before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
    @album  = FactoryGirl.create( :album )
  end

  describe "GET 'index'" do
    describe "for non-signed users" do
      it "should access" do
        get :index, :locale => :en, :album_id => @album
        response.should be_success
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should access" do
        get :index, :locale => :en, :album_id => @album
        response.should be_success
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :index, :locale => :en, :album_id => @album
        response.should be_success
      end
    end
  end

  describe "GET 'new'" do
    describe "for non-signed users" do
      it "should deny access" do
        get :new, :locale => :en, :album_id => @album
        response.should_not be_success
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        get :new, :locale => :en, :album_id => @album
        response.should_not be_success
      end
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
      @attrs = { :image => [ fixture_file_upload('/files/violin.jpg', 'image/jpg') ] }
    end

    describe "for non-signed users" do
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

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

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

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should create" do
        expect do
          post :create, :locale => :en, :album_id => @album, :photo => @attrs
        end.to change( Photo, :count ).by(1)
      end
    end
  end

  # describe "GET 'edit'" do
  #   before(:each) do
  #     @photo = FactoryGirl.create(:photo)
  #   end

  #   describe "for non-signed users" do
  #     it "should deny access" do
  #       get :edit, :locale => :en, :id => @photo
  #       response.should redirect_to( root_path )
  #     end
  #   end

  #   describe "for signed-in users" do
  #     before(:each){ test_sign_in( @user ) }

  #     it "should deny access" do
  #       get :edit, :locale => :en, :id => @photo
  #       response.should redirect_to( root_path )
  #     end
  #   end

  #   describe "for signed-in admin" do
  #     before(:each){ test_sign_in( @admin ) }

  #     it "should access" do
  #       get :edit, :locale => :en, :id => @photo
  #       response.should be_success
  #     end
  #   end
  # end
end
