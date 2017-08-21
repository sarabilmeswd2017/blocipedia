class WikisController < ApplicationController
  #after_action :verify_authorized, except: :index
  #after_action :verify_policy_scoped, only: :index

  def index
    #@wikis = Wiki.all
     @wikis = policy_scope(Wiki)
  end

  def show
    @wiki = Wiki.find(params[:id])
  end

  def new
    @wiki = Wiki.new
    authorize @wiki
  end

  def edit
    @wiki = Wiki.find(params[:id])
  end

  def create
    @wiki = Wiki.new
    @wiki.title = params[:wiki][:title]
    @wiki.body = params[:wiki][:body]
    @wiki.private = params[:wiki][:private]



  if @wiki.save
      flash[:notice] = "Wiki was saved."
       redirect_to [@wiki]
     else
       flash.now[:alert] = "There was an error saving the wiki. Please try again."
       render :new
     end
  end

  def update
    @wiki = Wiki.find(params[:id])
    @wiki.assign_attributes(wiki_params)
    authorize @wiki

    #if @wiki.update_attributes(permitted_attributes(@wiki))
      #redirect_to @wiki
    #else
      #render :edit
    #end

    if @wiki.save
      flash[:notice] = "Wiki was updated."
      redirect_to [@wiki]
    else
      flash.now[:alert] = "There was an error saving the wiki. Please try again."
      render :edit
    end
  end


    def destroy
     @wiki = Wiki.find(params[:id])
     authorize @wiki
     if @wiki.destroy
       flash[:notice] = "\"#{@wiki.title}\" was deleted successfully."
       redirect_to @wiki
     else
       flash.now[:alert] = "There was an error deleting the wiki."
       render :show
     end
   end





end
