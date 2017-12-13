class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_article, except: [:index, :new, :create]

  #GET /articles
  def index
    #Obtiene todos los registros SELECT * FROM articles
    @articles = Article.all
  end
  #GET /articles/:id
  def show
    #Encontrar un registro por id
    @article.update_visits_count
    @comment = Comment.new
  end

  #GET /articles/new
  def new
    @article = Article.new
    @categories = Category.all
  end

  def edit
  end
  #POST /articles
  def create
    #INSERT INTO
    @article = current_user.articles.new(article_params)
    @article.categories = params[:categories]

    if @article.save
      redirect_to @article
    else
      render :new
    end

  end

#Destroy elimina el objeto de la BD
#DELETE /articles/:id
  def destroy
    #DELETE FROM articles
    @article.destroy
    redirect_to articles_path
  end

  #PUT /articles/:id
  def update
    #UPDATE
    # @article.update_attributes({title: 'Nuevo titulo'})
    if @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  private

  def set_article
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :body, :categories)
  end

end
