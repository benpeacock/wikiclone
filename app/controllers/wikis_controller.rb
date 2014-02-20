class WikisController < ApplicationController
	before_filter :set_wiki, only: [:edit, :show, :update, :destroy]

  def index
  	@wikis = Wiki.all
  end

  def show
  end

  def new #page where form lives
  	@wiki = Wiki.new
  end

  def edit
  	
  	# show existing wiki object in a form
  end

  def create
  	# create wiki from form
  	@wiki = Wiki.new(params[:wiki])
  	@wiki.user = current_user
  	if @wiki.save
  		flash[:notice] = "your wiki was saved"
  		redirect_to @wiki #redirects to wiki that was just saved
  	else
  		flash[:error] = "Whoops!"
  		render :new #saves form information and pushes it back into displayed form
  	end
  end

  def update
  	# update existing wiki from form
  end

  def destroy
  end

  private 

  def set_wiki
  	@wiki = Wiki.find(params[:id])
  end
end
