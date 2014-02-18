class Wiki < ActiveRecord::Base
  attr_accessible :body, :private, :title
end
