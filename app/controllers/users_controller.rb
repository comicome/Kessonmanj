class UsersController < ApplicationController

  def show
    if params[:id] == "sign_out"
      sign_out current_user
    else
      @user = User.find(params[:id])
    end
  end

end