class WikisController < ApplicationController
  def index
  	@wikis = Wiki.all
  end

  def show
  	@wiki = Wiki.find(params[:id])
  end

  def new
  	@wikis = Wiki.new
  end

  def edit
  end
end
