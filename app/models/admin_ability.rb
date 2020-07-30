class AdminAbility
  include CanCan::Ability


  def initialize(user)

    user ||= User.new # guest user (not logged in)

    alias_action :create, :read, :update, :destroy, :to => :crud


  end
end