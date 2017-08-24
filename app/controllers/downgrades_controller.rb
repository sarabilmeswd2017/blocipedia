class DowngradesController < ApplicationController
  def create
    current_user.standard!
    
    privatewiki.update_attribute(private: false)
    flash[:notice] = "You have downgraded your account to standard and your private wikis will now become public."

    redirect_to root_path
  end
end
