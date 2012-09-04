class ArticlesController < ApplicationController
  def index

  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new( params[:article] )

    if @article.save
      redirect_to articles_path
      flash[:success] = "It has been created!"
    else
      render 'new'                                                                        # It should be placed after flash message or you will have to click button twice.
    end
  end
end
