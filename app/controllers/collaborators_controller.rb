class CollaboratorsController < ApplicationController
  def new

    @collaborator = User.new
  end

  def create
    
    @collaborator = User.new

    if @collaborator.save
      flash[:notice] = "Collaborator was saved"
      redirect_to [new_collaborator_path]

    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :new
    end

  end

  def destroy
    @wiki = Wiki.find(params[:id])

    if @collaborator.destroy
      flash[:notice] = "\"#{@collaborator}\" was deleted"
      redirect_to [edit_wiki_path]
    else
      flash.now[:alert] = "There was an error deleting the collaborator."
      render [edit_wiki_path]
    end
  end
end
