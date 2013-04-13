class TestsController < ApplicationController
  def index
    puts "----> tests (index): #{ActionView::Template::Handlers.extensions}"
  end
end
