class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

  def create
    # byebug
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
       session[:user_id] = @user.id
       @user = User.find(session[:user_id])
       redirect_to '/welcome'
    else
       redirect_to '/login' 
  end
  end 

  def login
  end

  def page_requires_login
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end
end
