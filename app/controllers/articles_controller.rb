# encoding: UTF-8
class ArticlesController < ApplicationController
  load_and_authorize_resource

  def index
    @articles = Article.order("updated_at DESC").page(params[:page]).per(5)
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

  def edit
  end

  def update
    if @article.update_attributes( params[:article] )
      redirect_to articles_path
      flash[:success] = "Статья успешно обновлена (tranlste it!)!"
    else
      render 'edit'
    end
  end
end
