class ArticlesController < ApplicationController
  # Usado para executar um método específico antes de qualquer ação/método da
  # classe. Se pode limitar os métodos que em que será executado antes com o
  # :only
  before_action :set_article, only: [ :show, :edit, :update, :destroy ]
  before_action :require_user, except: [ :show, :index ]
  before_action :require_same_user, only: [ :edit, :update, :destroy ]

  def show
    # binding.break # Utilizado para debug
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.new(article_params)

    # Resolução temporária para o uso do front-end
    @article.user = current_user

    if @article.save
      flash[:notice] = "Article was created successfully."
      redirect_to @article
    else
      # A partir do Rails 7 é necessário alterar o código de resposta para um
      # status, caso contrário, os erros não serão exibidos
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully."
      redirect_to @article
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  # private - Faz com que todos os métodos abaixo da sua declaração se tornem
  # executáveis apenas dentro da classe
  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end

  def require_same_user
    if current_user != @article.user
      flash[:alert] = "You can only edit or delete your own article"
      redirect_to @article
    end
  end
end
