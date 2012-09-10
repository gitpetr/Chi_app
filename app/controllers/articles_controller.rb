class ArticlesController < ApplicationController
  load_and_authorize_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
    @articles = Article.order(:updated_at).page(params[:page]).per(5)
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new( params[:article] )

    if @article.save
      redirect_to articles_path
      flash[:success] = t(:article_created_message)
    else
      render 'new'
    end
  end
end
