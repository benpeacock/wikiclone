class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  has_many :wikis
  has_many :collaborators

  # automatically assigns role of 'member' to each user who signs up.  set_member method lives below.
  before_create :set_member

  # Setting ROLES constant
  ROLES = %w[member premium_member admin]

  #defining role? method that Cancan will use for role-based permission system
	def role?(base_role)
  	role.nil? ? false : ROLES.index(base_role.to_s) <= ROLES.index(role)
	end

	private

	# Sets the role of a user to 'member'
	def set_member
		self.role = 'member'
	end
end
