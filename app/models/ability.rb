class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    
    if user.role == "admin"
      can :manage, :all
      
    if user.role == "worker"
      can :pop, JobQueue
      can [:accept, :download, :report_error], Job, :assigned_to => user.id
    end
    
  end
end
