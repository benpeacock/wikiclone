class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user, not logged in

    # # if a member, they can: a) inherit permission of users (read all except private wikis), b)manage their own wikis, c) destroy their own wikis
    # if User.role? :member
    #   can :manage, Wiki, :user_id => user.id
    #   can :destroy, Wiki, :user_id => user.id
    # # Regular members can't create or read private wikis
    #   cannot :manage, Wiki, private => true
    # end

    # # if a premium member, they: a) inherit permissions of members, b) can create collaborators, c) destroy collaborators
    # if User.role? :premium_member
    #   can :create, Collaborators
    #   can :destroy, Collaborators
    #   #Premium members can create private wikis that only they and collaboratos can access
    #   can :manage, Wiki, private => true, user_id => user.id
    # end

    # # Admins can do anything
    # if User.role? :admin
    #   can :manage, :all
    # end

    # # All users can read any public wiki
    # can :read, Wiki, private => false

    # >>> Pasted

    # if a member, they can manage their own posts 
    # (or create new ones)
    if user.role? :member
      can :manage, Wiki, :user_id => user.id, :private => false
      cannot :manage, @collaborators
      # can :manage, Wiki, :user_id => user.id
    end

    # Moderators can delete any post
    if user.role? :premium_member
      can :manage, Wiki, :user_id => user.id, :private => true
      can :manage, @collaborators
    end

    # Admins can do anything
    if user.role? :admin
      can :manage, :all
    end

    can :read, :all
  end
end