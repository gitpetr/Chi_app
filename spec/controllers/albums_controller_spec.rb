require 'spec_helper'

describe AlbumsController do
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

  describe "GET 'new'" do
    describe "for non-signed users" do
      it "should deny access" do
        get :new, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        get :new, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :new, :locale => :en
        response.should be_success
      end
    end
  end

  describe "POST 'create'" do
    before(:each) do
      @attrs = { :name => "name", :description => "" }
    end

    describe "for non-signed users" do
      it "should deny access" do
        post :create, :locale => :en, :album => @attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, :locale => :en, :album => @attrs
        end.to_not change( Album, :count )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        post :create, :locale => :en, :album => @attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, :locale => :en, :album => @attrs
        end.to_not change( Album, :count )
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should create" do
        expect do
          post :create, :locale => :en, :album => @attrs
        end.to change( Album, :count ).by(1)
      end
    end
  end

  describe "GET 'edit'" do
    before(:each) do
      @album = FactoryGirl.create(:album)
    end

    describe "for non-signed users" do
      it "should deny access" do
        get :edit, :locale => :en, :id => @album
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        get :edit, :locale => :en, :id => @album
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :edit, :locale => :en, :id => @album
        response.should be_success
      end
    end
  end

  describe "PUT 'update" do
    before(:each) do
      @album = FactoryGirl.create(:album)
      @attrs = { :name => "name2", :description => "" }
    end

    describe "for non-signed users" do
      it "should deny access" do
        put :update, :locale => :en, :id => @album, :album => @attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should not update" do
        put :update, :locale => :en, :id => @album, :album => @attrs
        @album.reload
        @album.name.should_not == @attrs[:name]
      end
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( @admin ) }

      it "should update" do
        put :update, :locale => :en, :id => @album, :album => @attrs
        @album.reload
        @album.name.should  == @attrs[:name]
      end
    end
  end

  describe "DELETE 'destroy'" do
    before(:each) do
      @album = FactoryGirl.create(:album)
    end

    describe "for non-signed users" do
      it "should deny access" do
        delete :destroy, :locale => :en, :id => @album
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, :locale => :en, :id => @album
        end.to_not change( Album, :count )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      it "should deny access" do
        delete :destroy, :locale => :en, :id => @album
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, :locale => :en, :id => @album
        end.to_not change( Album, :count )
      end
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( @admin ) }

      it "should delete" do
        expect do
          delete :destroy, :locale => :en, :id => @album
        end.to change(Album, :count).by(-1)
      end
    end
  end
end
