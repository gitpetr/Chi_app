class PagesController < ApplicationController
  def home
    @var = "lorem " * 10000
  end
end
