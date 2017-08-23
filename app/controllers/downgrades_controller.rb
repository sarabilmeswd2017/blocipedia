class DowngradesController < ApplicationController
  def create
    current_user.standard!
    flash[:notice] = "You have downgraded your account to standard."
    redirect_to root_path
  end
end
