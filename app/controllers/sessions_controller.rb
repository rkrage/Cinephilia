class SessionsController < ApplicationController
  def new
    @title = "Sign in"
  end

  def create
    user = User.authenticate(params[:session][:email],
    params[:session][:password])
    if user.nil?
      flash.now[:error] = "Invalid email/password combination."
      @title = "Sign in"
      render 'new'
    else
      sign_in user
      flash[:success] = "Welcome back " + user.name + "!"
      redirect_back_or user
    end
  end

  def destroy
    sign_out
    flash[:success] = "You are now logged out."
    redirect_to root_path
  end

end
