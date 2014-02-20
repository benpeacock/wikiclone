class UsersController < ApplicationController
  def index
  	@users = User.index
  end
end
