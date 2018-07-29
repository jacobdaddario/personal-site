class PostsController < ApplicationController
  def new
    @user = helpers.current_user
    @post = @user.posts.build()
  end
end
