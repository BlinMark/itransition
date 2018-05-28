class Ability
  include CanCan::Ability

  def initialize(user)


    user ||= User.new


    if user.role == "admin"
      can :manage, :all
    elsif user.role == "writer"
      can [:edit, :update, :delete], Post, :user_id => user.id
      can [:new, :create], Post
      can [:edit, :update], User, :id => user.id
      can :read, :all
    elsif user.role == "reader"
      can :read, :all
      can [:edit, :update], User, :id => user.id
    elsif user.role == "user"
      can :read, :all
      can [:edit, :update], User, :id => user.id
    else
      can :read, :all
    end
  end

end


