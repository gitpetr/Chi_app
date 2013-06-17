require 'spec_helper'

describe ArticlesController do
  render_views

  before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'index'" do
    shared_examples "render-success" do
      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "render-success"
    end
  end

  describe "GET 'show'" do
    before(:each){ @article = FactoryGirl.create :article }

    shared_examples "render-success-and-show" do
      it "should access" do
        get :show, :id => @article, :locale => :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "render-success-and-show"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "render-success-and-show"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "render-success-and-show"
    end
  end

  describe "GET 'new'" do

    shared_examples "new-render-success" do
      it "should deny access" do
        get :new, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "new-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "new-render-success"
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
      @article = FactoryGirl.build(:article, :user => @admin, :content => "some", :title => "bla-bla")
    end

    shared_examples "redirect-to-root-and-not-create" do
      it "should deny access" do
        post :create, :locale => :en, :article => @article
        response.should redirect_to( root_path )
      end

      it "should not create article" do
        expect do
          post :create, :locale => :en, :article => @article
        end.to_not change( Article, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "redirect-to-root-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "redirect-to-root-and-not-create"
    end

    # describe "for signed-in admin" do
    #   it "should create article" do
    #     sign_in :article, @admin

    #     expect do
    #       post :create, :locale => :en, :article => @article#.attributes.merge(:content => "some" )
    #       # post :create, :locale => :en, :articles => { :content => "some", :title => "text" }, :user_id => @admin.id
    #     end.should change( Article, :count ).by(1)
    #   end
    # end
  end

  describe "GET 'edit'" do
    before(:each) do
      @article = FactoryGirl.create(:article, :user => @admin, :content => "some", :title => "bla-bla")
    end

    shared_examples "edit-redirect-to-root" do
      it "should deny access" do
        get :edit, :locale => :en, :id => @article
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "edit-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "edit-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should access" do
        get :edit, :locale => :en, :id => @article
        response.should be_success
      end
    end
  end

  # describe "PUT 'update'" do
  #   before(:each) do
  #     @article = FactoryGirl.create(:article, :user => @admin, :content => "some", :title => "bla-bla")
  #   end

  #   describe "for signed-in admin" do
  #     before(:each){ test_sign_in( @admin ) }

  #     it "should be done" do
  #       text = "last"
  #       put :update, :locale => :en, :id => @article, :article => @article.attributes.merge( :title => text )
  #       @article.reload
  #       @article.title.should == text
  #     end
  #   end
  # end
end
