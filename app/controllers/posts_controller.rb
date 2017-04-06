class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end
  def index
    @posts = current_user.posts
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_patams)
    @post.group =@group
    @post.user = current_user

    if @group.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end
  private
  def post_patams
    params.require(:post).permit(:content)
  end
  def edit
    @group = Groups.find(params[:id])
  end
  def update
    @group = Groups.find(params[:id])
    @posts.update(posts_params)
    reditect_to posts_path, notice: "Update success"
  end

end
