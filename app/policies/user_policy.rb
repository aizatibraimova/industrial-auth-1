class UserPolicy < ApplicationPolicy
  attr_reader :current_user, :user

  def initialize(current_user, user)
    @current_user = current_user
    @user = user
  end

  def show?
    true
  end

  def show_photos?
     !user.private? || current_user == user || user.followers.include?(current_user) || current_user.followers.include?(user)
  end
  
  def followers?
    true
  end

  def following?
    true
  end

  def discover?
    true
  end

  def feed?
    true
  end

  def update?
    user == current_user
  end

  def edit?
    update?
  end

  def destroy?
    current_user == user 
  end
end
