class Ability
  include CanCan::Ability

  def initialize user, controller_namespace
    case controller_namespace
    when "Admin"
      can :manage, :all if user.admin?
    else
      can :read, :all
      can :manage, User
      can [:create, :update], Exam
    end
  end
end
