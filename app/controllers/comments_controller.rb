class CommentsController < ApplicationController
  
  before_action :require_user
  
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.build(comments_params)
    @comment.user = current_user
    if @comment.save
      flash[:success] = "Comment was created successfully"
      redirect_to article_path(@article)
    else
      flash[:warning] = "Comment creation failed"
      redirect_to :back
    end
  end
  
  private
  
  def comments_params
    params.require(:comment).permit(:description)
  end
end