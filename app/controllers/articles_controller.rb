class ArticlesController < ApplicationController
  def show
    # binding.break # Utilizado para debug
    @article = Article.find(params[:id])
  end

  def index
    @articles = Article.all
  end

  def new
  end

  def create
    # render plain: params[:article]
    @article = Article.new(params.require(:article).permit(:title, :description))
    @article.save
    # redirect_to articles_path(@article)
    redirect_to @article
  end
end
