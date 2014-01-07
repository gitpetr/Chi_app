require 'spec_helper'

describe ArticlesController do
  let(:admin) { FactoryGirl.create( :admin ) }
  let(:user)  { FactoryGirl.create( :user ) }

  describe "GET 'index'" do
    shared_examples "article-index-render-success" do
      it "should access" do
        get :index, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "article-index-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "article-index-render-success"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "article-index-render-success"
    end
  end

  describe "GET 'show'" do
    let(:article) { FactoryGirl.create :article }

    shared_examples "article-show-render-success-and-show" do
      it "should access" do
        get :show, id: article, locale: :en
        response.should be_success
      end
    end

    describe "for non-signed users" do
      include_examples "article-show-render-success-and-show"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "article-show-render-success-and-show"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      include_examples "article-show-render-success-and-show"
    end
  end

  describe "GET 'new'" do
    shared_examples "article-new-render-success" do
      it "should deny access" do
        get :new, locale: :en
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "article-new-render-success"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "article-new-render-success"
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
    let(:attrs) { {content: "some", title: "text"} }

    shared_examples "article-create-redirect-to-root-and-not-create" do
      it "should deny access" do
        post :create, locale: :en, article: attrs
        response.should redirect_to( root_path )
      end

      it "should not create article" do
        expect do
          post :create, locale: :en, article: attrs
        end.to_not change( Article, :count )
      end
    end

    describe "for non-signed users" do
      include_examples "article-create-redirect-to-root-and-not-create"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "article-create-redirect-to-root-and-not-create"
    end

    describe "for signed-in admin" do
      it "should create article" do
        test_sign_in( admin )

        expect do
          post :create, locale: :en, article: attrs
        end.to change( Article, :count ).by(1)
      end
    end
  end

  describe "GET 'edit'" do
    let(:article) { FactoryGirl.create(:article, user: admin) }

    shared_examples "article-edit-redirect-to-root" do
      it "should deny access" do
        get :edit, locale: :en, id: article
        response.should redirect_to( root_path )
      end
    end

    describe "for non-signed users" do
      include_examples "article-edit-redirect-to-root"
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples "article-edit-redirect-to-root"
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should access" do
        get :edit, locale: :en, id: article
        response.should be_success
      end
    end
  end

  describe "PUT 'update'" do
    let(:article) { FactoryGirl.create(:article, user: admin) }
    let(:attrs) { {content: "some", title: "last"} }

    describe "for non-signed users" do
      it "should deny access" do
        put :update, locale: :en, id: article, article: attrs
        response.should redirect_to( root_path )
      end
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      it "should not update" do
        put :update, locale: :en, id: article, article: attrs
        article.reload
        article.title.should_not == attrs[:title]
      end
    end

    describe "for signed-in admin" do
      before(:each){ test_sign_in( admin ) }

      it "should update" do
        put :update, locale: :en, id: article, article: attrs
        article.reload
        article.title.should == attrs[:title]
      end
    end
  end

  describe "DELETE 'destroy'" do
    let!(:article) { FactoryGirl.create(:article, user: admin) }

    shared_examples "article-delete-redirect-to-root-and-not-delete" do
      it "should deny access" do
        delete :destroy, locale: :en, id: article
        response.should redirect_to( root_path )
      end

      it "should not delete" do
        expect do
          delete :destroy, locale: :en, id: article
        end.to_not change( Article, :count )
      end
    end

    describe "for non-signed users" do
      include_examples 'article-delete-redirect-to-root-and-not-delete'
    end

    describe "for signed-in users" do
      before(:each){ test_sign_in( user ) }

      include_examples 'article-delete-redirect-to-root-and-not-delete'
    end

    describe "for signed-in admins" do
      before(:each){ test_sign_in( admin ) }

      it "should delete" do
        expect do
          delete :destroy, locale: :en, id: article
        end.to change(Article, :count).by(-1)
      end
    end
  end
end
