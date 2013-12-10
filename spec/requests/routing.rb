require "spec_helper"

describe "I18n" do
  it "redirects / to /ru" do
    get "/"
    response.should redirect_to "/ru"
  end

  it "redirects /bla-bla to /ru/bla-bla" do
    get "/bla-bla"
    response.should redirect_to "/ru/bla-bla"
  end
end

describe "Login routes" do
  it "redirects /login to /ru/login" do
    get "/login"
    response.should redirect_to "/ru/login"
  end

  it "redirects /ru/login to devise/sessions#new" do
    get "/ru/login"
    response.should redirect_to new_user_session_path(locale: :ru)
  end
end