class CollaboratorsController < ApplicationController
  def create
    @user = User.find_by(email: params[:email])
    @wiki = Wiki.find_by(params[:wiki_id])
    @collaborator = Collaborator.new(user_id: @user_id, wiki_id: @wiki_id)
    if @collaborator.save
      flash[:notice] = "Collaborator was saved"
    else
      flash[:alert] = "There was an error saving the wiki. Please try again."
    end
    redirect_to @wiki
  end

  def destroy
    @wiki = Wiki.find_by(params[:wiki_id])
    @user = User.find_by(params[:user_id])
    @collaborator = Collaborator.find_by(user_id: @user_id, wiki_id: @wiki_id)
    if @collaborator.destroy
      flash[:notice] = "\"#{@user.email}\" was deleted"
    else
      flash[:alert] = "There was an error deleting the collaborator."
    end
    redirect_to @wiki
  end
end
