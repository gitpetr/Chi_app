class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = Article.order(:updated_at).page(params[:page]).per(5)
  end

  def show
  end

  def new
  end

  def create
    if @article.save
      redirect_to articles_path
      flash[:success] = t(:article_created_message)
    else
      render 'new'
    end
  end
end
