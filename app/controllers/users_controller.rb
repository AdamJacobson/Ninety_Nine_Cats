class UsersController < ApplicationController

  before_action :cant_login_if_loggedin, only: [:new, :create]

  def cant_login_if_loggedin
    redirect_to cats_url if current_user
  end

  def new
    @user = User.new
    render :new
  end

  def create
    user = User.new(user_params)
    if user.save
      login!(user)
    else
      render json: "Invalid login"
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
