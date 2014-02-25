class Wiki < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title
  attr_accessible :body, :private, :title

  belongs_to :user
  has_many :collaborators

  #Checks whether user is a collaborator on the current wiki
  def has_collaborator?(user)
  	collaborators.where(user_id: user.id).any?
  end
end
