class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    # Temp fix for authorising admins - try to add first and last names 
    # can :manage, User, id: user.id
    if user.admin?
      can :manage, :all?
    else
      can :read, :all?
    end
  end

 end

# See the wiki for details:
# https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
