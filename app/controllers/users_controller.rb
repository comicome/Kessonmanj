class UsersController < ApplicationController

  def profile
    @auser = User.find(current_user)
  end

end