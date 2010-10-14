class Ability 
  include CanCan::Ability
    
  def initialize(user)
    alias_action :update, :destroy, :to => :modify
    
    user ||= User.new
    
    can :read, Article
    
    if !user.new_record?
      can :create, Article
    end
    
    can :modify, Article do |article|
      article.user == user
    end
    
    if user.admin?
      can :manage, Category
      can :manage, Article
    end
    
  end
end