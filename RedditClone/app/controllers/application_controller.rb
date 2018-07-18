class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  helper_method :current_user, :logged_in?
  
  def login_user(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end
  
  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  def logged_in?
    !!current_user
  end
  
  def logout
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  def require_logged_in
    redirect_to new_session_url unless logged_in?
  end
  
  def require_moderator 
    @sub = Sub.find_by(id: params[:id])
    redirect_to subs_url unless @sub.moderator_id == current_user.id
  end
  
  def require_author
    @post = Post.find_by(id: params[:id])
    redirect_to sub_post_url(@post) unless @post.author_id == current_user.id
  end
  
end
