class PostsController < ApplicationController
  before_action :set_post, only: %i[destroy edit update show]


  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
      if @post.save
        respond_to :js
      else 
        respond_to :html
    end
  end 

  def edit
    respond_to :js 
  end

  def update
      if @post.update(post_params)        
        respond_to :js
      else
        redirect_to posts_path, alert: 'Error al actualizar'     
      end
  end

  def show
    @comment = Comment.new 
    @comments = Comment.where(post: @post)  
    respond_to :js 
    
  end
    
  
  def destroy
    @post.destroy
      respond_to :js
  end
  
  def busqueda 
    @posts= Post.where("title LIKE ?","%#{params[:input]}%")
    respond_to :js
    
  end 
    
  private

  def post_params
    params.require(:post).permit(:title, :content)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end





