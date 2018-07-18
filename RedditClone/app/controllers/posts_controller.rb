class PostsController < ApplicationController
  
  before_action :require_logged_in
  before_action :require_author, only: [:edit, :update, :destroy]
  
  def new
    @post = Post.new
    render :new
  end
  
  def create
    @post = Post.new(post_params)
    # params[:post][:sub_ids].each do |sub_id| 
    #   PostSub.create(sub_id: sub_id, post_id: @post.id)
    # end
    @post.author_id = current_user.id
    if @post.save 
      redirect_to sub_post_url(params[:sub_id], @post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :new 
    end
  end
  
  def edit
    @post = Post.find_by(id: params[:id])
    render :edit    
  end
  
  def update
    @post = Post.find_by(id: params[:id])
    if @post.update_attributes(post_params)
      redirect_to sub_post_url(params[:sub_id], @post)
    else 
      flash.now[:errors] = @post.errors.full_messages
      render :edit 
    end
  end
  
  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end
  
  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy 
    redirect_to subs_url
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :url, :content, sub_ids: [])
  end
end 