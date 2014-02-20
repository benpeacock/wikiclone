class CollaboratorsController < ApplicationController
  
  def new
  	@collaborator = Collaborator.new
  end

  def create
  	@collaborator = Collaborator.new(params[:id])
  	if @collaborator.save
  		flash[:notice] = "your wiki was saved"
  		redirect_to @wiki #redirects to wiki that was just saved
  	else
  		flash[:error] = "Whoops!"
  		render :new #saves form information and pushes it back into displayed form
  	end
  end

  def show
  end

  def edit
  end
end
