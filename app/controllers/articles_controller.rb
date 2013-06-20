class ArticlesController < ApplicationController
  before_filter :require_login, except: [:show, :index, :incPageView]
  
  def index
    @articles = Article.order("created_at DESC")
    @top3 = Article.order("views DESC").first(3)
    @article = Article.new
  end

  def show
    @article = Article.find(params[:id])
    incPageView(@article)
    @comment = Comment.new
    @comment.article_id = @article.id
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(params[:article])
    @article.views = 0
    @article.save

    flash.notice = "Successfully created '#{@article.title}'"
    redirect_to article_path(@article)
  end

  def edit
    @article = Article.find(params[:id])
  end

  def update
    @article = Article.find(params[:id])
    @article.update_attributes(params[:article])

    flash.notice = "'#{@article.title}'' updated"
    redirect_to article_path(@article)
  end

  def destroy
    @article = Article.find(params[:id])
    @article.destroy

    flash.notice = "Successfully deleted '#{@article.title}'!"
    redirect_to articles_path
  end

  def incPageView(article)
    article.views += 1
    article.update_attributes(params[:views])
  end
end
