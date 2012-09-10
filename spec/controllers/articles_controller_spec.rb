require 'spec_helper'

describe ArticlesController do
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

  # describe "POST 'create'" do
  #   before(:each){ @article = FactoryGirl.build(:article, :user => @admin) }

  #   describe "for non-signed users" do
  #     it "should deny access" do
  #       post :create, :locale => :en, :article => @article.attributes.merge( :content => "some" )
  #       response.should redirect_to( root_path )
  #     end

  #     it "should not create article" do
  #       expect do
  #         post :create, :locale => :en, :article => @article.attributes.merge(:content => "some" )
  #       end.should_not change( Article, :count )
  #     end
  #   end

  #   describe "for signed-in users" do
  #     before(:each){ test_sign_in( @user ) }

  #     it "should deny access" do
  #       post :create, :locale => :en, :article => @article.attributes.merge( :content => "some" )
  #       response.should redirect_to( root_path )
  #     end

  #     it "should not create article" do
  #       expect do
  #         post :create, :locale => :en, :article => @article.attributes.merge(:content => "some" )
  #       end.should_not change( Article, :count )
  #     end
  #   end

    # describe "for signed-in admin" do
    #   before(:each){ test_sign_in( @admin ) }
    #   it "should create article" do
    #     expect do
    #       post :create, :locale => :en, :article => @article.attributes.merge(:content => "some" )
    #     end.should change( Article, :count ).by(1)
    #   end
    # end
  # end
end
