class Collaborator < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  # attr_accessible :title, :body
end
