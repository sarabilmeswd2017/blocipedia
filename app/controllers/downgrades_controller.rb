class DowngradesController < ApplicationController
  def create
    current_user.standard!
    if params[:private] == true
      params[:private] = false
    end
    flash[:notice] = "You have downgraded your account to standard and your private wikis will now become public."

    redirect_to root_path
  end
end
