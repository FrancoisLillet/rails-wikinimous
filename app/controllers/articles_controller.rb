class ArticlesController < ApplicationController
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def show
    @article = find_article(params[:id])
  end

  def edit
    @article = find_article(params[:id])
  end

  def update
    @article = find_article(params[:id])
    @article.update(article_params)
    redirect_to article_path(params[:id])
  end

  def destroy
    @article = find_article(params[:id])
    @article.destroy
    redirect_to articles_path
  end

  private

  def find_article(id)
    return Article.find(id)
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
