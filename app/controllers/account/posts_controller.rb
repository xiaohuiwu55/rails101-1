class Account::PostsController < ApplicationController
  before_action :authenticate_user!
  def index
    @posts = current_user.posts
  end
  def create
    @posts = Posts.index(posts_params)
    @posts.save
    redirect_to posts_path
  end
  private
  def posts_params
    params.require(:posts).permit(:content)
  end
  def edit
    @posts = Posts.index(params[:id])
  end
  def update
    @posts = Post.index(parmas[:id])
    @posts.update(posts_params)
    reditect_to posts_path, notice: "Update success"
  end

end
