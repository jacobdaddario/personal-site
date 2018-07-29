class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      helpers.login user
      flash[:success] = 'User successfully logged in'
      redirect_to root_url
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    helpers.logout
    redirect_to root_url
    flash[:success] = "User sucessfully signed out"
  end

end
