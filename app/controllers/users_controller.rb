class UsersController < ApplicationController

  

  def show
    @user = User.find(params[:id])
    @user_posts = @user.posts
  end

  def index

  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    authorize! :update, @user
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      redirect_to @user, success: 'User successfully updated'
    else
      flash.now[:danger] = "User not updated"
      render :edit
    end
  end

  private
 
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :role, :avatar)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
