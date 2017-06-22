class SessionsController < ApplicationController

  before_action :cant_signin_if_already, only: [:new, :create]

  def cant_signin_if_already
    redirect_to cats_url if current_user
  end

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    login!(user)
  end

  def destroy
    logout!
  end

end
