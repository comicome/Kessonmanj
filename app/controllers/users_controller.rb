class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, except: [:show]

  def show  
    @user = User.find(params[:id])
  end

  def edit
  end

  def edit_password
  end

  def update_password
    if @user.update_with_password(user_password)
      # Sign in the user by passing validation in case their password changed
      bypass_sign_in(@user)
      redirect_to @user
    else
      render "edit"
    end
  end

  def update
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_password
    params.require(:user).permit(:current_password, :password, :password_confirmation)
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :nickName, :email, :avatar)
  end

  def set_user
    @user = current_user
  end

end