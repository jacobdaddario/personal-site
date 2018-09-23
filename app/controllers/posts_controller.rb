class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :create, :edit, :update, :destroy]

  # See below for an explanation
  # before_action :correct_user, only: [:create, :update, :destroy]

  def show
    @post = Post.find params[:id]
  end

  def index
    @posts = Post.all.paginate(page: params[:page], per_page: 30)
  end

  def new
    @post = helpers.current_user.posts.build
  end

  def create
    # Meant to prevent posts from elsewhere
    @post = helpers.current_user.posts.build post_params
    if @post.save && !(params[:post][:all_tags].empty?)
      flash[:success] = "New post successfully created"
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = "Post successfully updated"
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    flash[:success] = "Post deleted"
    redirect_to posts_url
  end

  private
    # Required to prevent mass assignment
    def post_params
      params.require(:post).permit(:title, :content, :all_tags)
    end

    def logged_in_user
      unless helpers.logged_in?
        flash[:danger] = "Please log in"
        redirect_to root_url
      end
    end


    # I have commented this function out, because I can't figure out how to
    # access foreign keys. Because of how the associations work, I don't know
    # if the user_id can actually be sent maliciously through a request

    # def correct_user
      # Redirects unless the current user object extracted from the session
      # id matches the user object extracted from the post's association
    #   unless helpers.current_user == User.find(params[:post][:user_id])
    #     flash[:danger] = "You can only write and edit your own articles"
    #     redirect_to root_url
    #   end
    # end

end
