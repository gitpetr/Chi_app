require 'spec_helper'

describe SermonsController do
	render_views

	 before(:each) do
    @admin = FactoryGirl.create( :admin )
    @user  = FactoryGirl.create( :user )
  end

  describe "GET 'index'" do
    shared_examples "sermons-render-success" do
      it "should access" do
        get :index, :locale => :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "sermons-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "sermons-render-success"
    end
  end

  describe "GET 'show'" do
    before(:each){ @sermon = FactoryGirl.create :sermon }

    shared_examples "sermons-render-success-and-show" do
      it "should access" do
        get :show, :id => @sermon, :locale => :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-render-success-and-show"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "sermons-render-success-and-show"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      include_examples "sermons-render-success-and-show"
    end
  end

  describe "GET 'new'" do
    shared_examples "sermons-deny access" do
      it "should deny access" do
        get :new, :locale => :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-deny access"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "sermons-deny access"
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
      @attrs = {  :title => "Dance",
                  :preacher => "Epica",
                  :recorded_date => DateTime.now,
                  :record => fixture_file_upload('/files/record.mp3', 'audio/mpeg') }
    end

    shared_examples "sermons-deny-access-and-not-create" do
      it "should deny access" do
        post :create, :locale => :en, :sermon => @attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, :locale => :en, :sermon => @attrs
        end.to_not change( Photo, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-deny-access-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( @user ) }

      include_examples "sermons-deny-access-and-not-create"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( @admin ) }

      it "should create" do
        expect do
          post :create, :locale => :en, :sermon => @attrs
        end.to change( Sermon, :count ).by(1)
      end
    end
  end
end
