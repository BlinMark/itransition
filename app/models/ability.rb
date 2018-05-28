class Ability
  include CanCan::Ability

  def initialize(user)


    user ||= User.new


    if user.role == "admin"
      can :manage, :all
    elsif user.role == "writer"
      can [:edit, :update, :delete], Post, :user_id => user.id
      can [:new, :create], Post
      can :read, :all
    elsif user.role == "reader"
      can :read, :all

    elsif user.role == "user"
      can :read, :all
    else
      can :read, :all
    end
  end

end


