class TestsController < ApplicationController
  def index
    puts "----> #{ActionView::Template::Handlers.extensions}"
  end
end
