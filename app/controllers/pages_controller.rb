class PagesController < ApplicationController
  def home
    # Redireciona para lista de artigos quando o usuário estiver logado e acessar o caminho raiz
    # redirect_to articles_path if logged_in?
  end
  def about
  end
end
