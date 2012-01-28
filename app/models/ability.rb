class Ability 
  include CanCan::Ability
    
  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    
    user ||= User.new
    
    can :read, Article
    
    can :modify, Article do |article|
      article.user == user
    end
    
    unless user.new_record?
      can :create, Article
      can :manage, User do |u|
        u == user
      end
    end

    if user.admin?
      can :manage, Category
      can :manage, Article
    end
    
  end
end
