class UsersController < ApplicationController

  def show
    if params[:id] == "sign_out"
      sign_out current_user
    else
      @user = User.find(params[:id])
    end
  end

  def edit
      @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    
    if @user.update(user_params)
        redirect_to @user
    else
        render 'edit'
    end
  end

  private
  def user_params
  params.require(:user).permit(:first_name, :last_name, :email)
  end

end