class CollaboratorsController < ApplicationController
  before_filter :get_wiki
  
  def new
  	@collaborator = Collaborator.new
  end

  def create
    authorize! :create, Collaborator
    @wiki.collaborators.destroy_all
    collaborators = []
    params[:collaborator][:user_id].each do |user_id|
      Rails.logger.info ">>>>> creating a collaborator"
      collaborators << Collaborator.create(wiki_id: @wiki.id, user_id: user_id)
    end
    Rails.logger.info ">>> #{Collaborator.all.inspect}"
    Rails.logger.info ">>>> #{@wiki.collaborators.inspect}"

    if collaborators.any?
      flash[:notice] = "Your collaborators have been added."
    else
      flash[:notice] = "You no longer have any collaborators on this wiki."
    end

    redirect_to @wiki
  end

  def show
  end

  def edit
  end

  private

  def get_wiki
    @wiki = Wiki.find(params[:wiki_id])
  end
end
