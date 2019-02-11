class ArticlesController < ApplicationController
  
  before_action :set_article, only: [:edit, :update, :show, :destroy, :like]
  before_action :require_user, except: [:index, :show, :like]
  before_action :require_same_user, only: [:edit, :update, :destroy]
  before_action :require_user_like, only: [:like]
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 5)
  end
  
  def new
    @article = Article.new
  end
  
  def create
    @article = Article.new(article_params)
    @article.user = current_user
    if @article.save
      flash[:success] = "Article was saved successfully"
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end
  
  def show
    @comment = Comment.new
    @comments = @article.comments.paginate(page: params[:page], per_page: 5)
  end
  
  def edit
    
  end
  
  def update
    if @article.update(article_params)
      flash[:success] = "Article was successfully updated"
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
  
  def destroy
    @article.destroy
    flash[:danger] = "Article was deleted successfully"
    redirect_to articles_path
  end
  
  def like
    like = Like.create(like: params[:like], user: current_user, article: @article)
    if like.valid?
      flash[:success] = "You've liked this article"
      redirect_to :back
    else
      flash[:warning] = "You can only like/dislike a recipe once"
      redirect_to :back
    end
  end
  

  
  private
  
    def set_article
       @article = Article.find(params[:id])
    end
  
    def article_params
      params.require(:article).permit(:title, :description, category_ids: [])
    end
  
  def require_same_user
    if current_user != @article.user and !current_user.admin?
      flash[:warning] = "You can edit or delete your own articles only"
      redirect_to root_path
    end
  end
  
  def require_user_like
    if !logged_in?
      flash[:warning] = "You must be logged in to perform that action"
      redirect_to :back
    end
end
  
end
