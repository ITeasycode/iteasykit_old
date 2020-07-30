class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    user ||= Iteasykit::User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud

    def initialize(user)
      can :create, :all
      if user.present?
        case user.role
        when '1'
          can :manage, :all
        when '3'
          can :update, Iteasykit::Individual, iteasykit_user_id: user.id
          can :manage, Iteasykit::CompanyNad, iteasykit_individual_id: user.iteasykit_individual.id
          can :create, Iteasykit::ContactU
        when '4'
          can :update, Iteasykit::Individual, iteasykit_user_id: user.id
          can :manage, Iteasykit::Car, iteasykit_individual_id: user.iteasykit_individual.id
          can :create, Iteasykit::ContactU
        when '5'
          can :update, Iteasykit::Individual, iteasykit_user_id: user.id
          can :manage, Iteasykit::House, iteasykit_individual_id: user.iteasykit_individual.id
          can :create, Iteasykit::ContactU
        end
      end
    end
  end
end
