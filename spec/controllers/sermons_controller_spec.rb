require 'spec_helper'

describe SermonsController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user)  { FactoryGirl.create( :user ) }

  describe "GET 'index'" do
    shared_examples "sermons-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermons-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "sermons-render-success"
    end
  end

  describe "GET 'show'" do
    let(:sermon) { FactoryGirl.create :sermon }

    shared_examples "sermons-render-success-and-show" do
      it "should access" do
        get :show, id: sermon, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-render-success-and-show"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermons-render-success-and-show"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "sermons-render-success-and-show"
    end
  end

  describe "GET 'new'" do
    shared_examples "sermons-deny access" do
      it "should deny access" do
        get :new, locale: :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-deny access"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermons-deny access"
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
    let(:attrs) { {title: "Dance",
                   preacher: "Epica",
                   recorded_date: DateTime.now,
                   record: fixture_file_upload('/files/record.mp3', 'audio/mpeg')} }

    shared_examples "sermons-deny-access-and-not-create" do
      it "should deny access" do
        post :create, locale: :en, sermon: attrs
        response.should redirect_to( root_path )
      end

      it "should not create" do
        expect do
          post :create, locale: :en, sermon: attrs
        end.to_not change( Photo, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-deny-access-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermons-deny-access-and-not-create"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should create" do
        expect do
          post :create, locale: :en, sermon: attrs
        end.to change( Sermon, :count ).by(1)
      end
    end
  end

  describe "GET 'edit'" do
    let(:sermon) { FactoryGirl.create :sermon }

    shared_examples "sermons-edit-redirect-to-root" do
      it "should deny access" do
        get :edit, locale: :en, id: sermon
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "sermons-edit-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermons-edit-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :edit, locale: :en, id: sermon
        response.should be_success
      end
    end
  end

  describe "PUT 'update'" do
    let(:sermon) { FactoryGirl.create :sermon }
    let(:attrs) { {title: "Dont Lose Your Way!", preacher: "Olga Zhilkova", recorded_date: "2013-07-28 18:36:11"} }

    describe "for non-signed users" do
      it "should deny access" do
        put :update, locale: :en, id: sermon, sermon: attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not update" do
        put :update, locale: :en, id: sermon, sermon: attrs
        sermon.reload
        sermon.title.should_not == attrs[:title]
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should update" do
        put :update, locale: :en, id: sermon, sermon: attrs
        sermon.reload
        sermon.title.should == attrs[:title]
      end
    end
  end

  describe "DELETE 'destroy'" do
    let!(:sermon) { FactoryGirl.create :sermon }

    shared_examples "sermon-destroy-deny-access-and-not-create" do
      it "should deny access" do
        delete :destroy, locale: :en, id: sermon
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, locale: :en, id: sermon
        end.to_not change( Sermon, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "sermon-destroy-deny-access-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "sermon-destroy-deny-access-and-not-create"
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( admin ) }

      it "should delete" do
        expect do
          delete :destroy, locale: :en, id: sermon
        end.to change( Sermon, :count ).by(-1)
      end
    end
  end
end
