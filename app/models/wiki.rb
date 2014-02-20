class Wiki < ActiveRecord::Base
  attr_accessible :body, :private, :title

  belongs_to :user
  has_many :collaborators

  def has_collaborator?(user)
  	collaborators.where(user_id: user.id).any?
  end
end
