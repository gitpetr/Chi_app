require 'spec_helper'

describe "Root path" do
  it "routes /ru to homes#index" do
    expect(get: "/ru").to route_to(controller: "homes", action: "index", locale: "ru")
  end
end