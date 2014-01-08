# encoding: UTF-8
class ArticlesController < ApplicationController
  load_and_authorize_resource

  layout "article", only: [ :index ]

  def index
    @articles = Article.order("updated_at DESC").page(params[:page]).per(5)
  end

  def show
  end

  def new
  end

  def create
    @article = current_user.articles.new( params[:article] )

    if @article.save
      redirect_to articles_path
      flash[:success] = t( :article_created_message )
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @article.update_attributes( params[:article] )
      redirect_to articles_path
      flash[:success] = t( :article_updated_message )
    else
      render 'edit'
    end
  end

  def destroy
    if @article.destroy
      flash[:success] = t( :article_deleted_message )
    end

    redirect_to articles_path
  end
end
