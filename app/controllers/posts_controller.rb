class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.paginate(page: params[:page], per_page: 5).all
  end

  def show
    if user_signed_in?
      @new_comment = Comment.build_from(@post, current_user.id, "")
    else
    end
  end

  def new
    @post = current_user.posts.build
  end

  def edit

  end

  def update
    if @post.update_attributes(post_params)
      redirect_to @post, success: 'Post successfully updated'
    else
      flash.now[:danger] = "Post not updated"
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, success: "Post successfully deleted"
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to @post, success: "Post successfully created"
    else
      flash.now[:danger] = "Post not created"
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :short_description, :description, :image, :all_tags, :category_id)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end