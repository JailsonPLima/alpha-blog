class ArticlesController < ApplicationController
  def show
    binding.break # Utilizado para debug
    @article = Article.find(params[:id])
  end
end
