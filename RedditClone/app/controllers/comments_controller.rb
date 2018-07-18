class CommentsController < ApplicationController
  
  def new 
    @comment = Comment.new
  end 
  
  def create 
    @comment = Comment.new(content: params[:comment][:content])
    @comment.author_id = current_user.id 
    @comment.post_id = params[:post_id]
    if @comment.save 
      redirect_to sub_post_url(params[:sub_id], params[:post_id])
    else 
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end 
  end 
  
  def show 
    @comment = Comment.find_by(id: params[:id])
  end 
  
end
