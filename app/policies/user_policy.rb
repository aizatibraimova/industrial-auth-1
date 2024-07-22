class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    !user.private? || current_user == user || user.followers.include?(current_user)
    true
  end

  def feed?
    !user.private? || current_user == user || user.followers.include?(current_user)
  end

  def update?
    user == current_user || current_user.admin?
  end

  def edit?
    update?
  end

  def destroy?
    urrent_user.admin?
  end
end
