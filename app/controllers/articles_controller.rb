class ArticlesController < ApplicationController
  before_filter do
    redirect_to :root unless current_user && current_user.admin?
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
