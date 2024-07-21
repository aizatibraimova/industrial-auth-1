class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def feed?
    true
  end

  def edit?
    update?
  end

  def update?
    user == current_user || current_user.admin?
  end

  def destroy?
    user == current_user || current_user.admin?
  end

  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(private: false).or(scope.where(id: user.following.id).or(scope.where(id: user.id)))
      end
    end
  end
end
