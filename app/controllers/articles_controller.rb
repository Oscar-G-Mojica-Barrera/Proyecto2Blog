class ArticlesController < ApplicationController
<<<<<<< HEAD

  def new
    @article = Article.new
  end
  def create
    @article = Article.new(article_params)
    if @article.save
      redirect_to @article
    else
     render 'new'
    end
=======
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_article, only: [:show, :edit, :update, :destroy]
  before_action :authorize_user!, only: [:edit, :update, :destroy]

  def new 
    @article = Article.new
  end  

  def index
    @articles = Article.all
  end

  def edit
    @article = Article.find(params[:id])
>>>>>>> 734aed9 (Actualizacion final)
  end

  def show
    @article = Article.find(params[:id])
  end
<<<<<<< HEAD
  def index
    @articles = Article.all
  end
  def edit
    @article = Article.find(params[:id])
  end
  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
     redirect_to @article
    else
     render 'edit'
    end
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end

 private 
    def article_params
     params.require(:article).permit(:title,:text)
    end
    
=======

  def update
    @article = Article.find(params[:id])
    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def create
    @article = current_user.articles.build(article_params)
    if @article.save
      redirect_to @article, notice: "Article was successfully created."
    else
      render :new
    end
  end
  
  def destroy
    @article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path, notice: 'Article and its comments were successfully deleted.'
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def authorize_user!
    unless @article.user == current_user
      redirect_to articles_path, alert: "You are not authorized to perform this action."
    end
  end

  def article_params
    params.require(:article).permit(:title, :text)
  end
>>>>>>> 734aed9 (Actualizacion final)
end