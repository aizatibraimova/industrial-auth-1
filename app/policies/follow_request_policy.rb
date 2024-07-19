class FollowRequestPolicy < ApplicationPolicy
  attr_reader :user, :follow_request

  def initialize(user, follow_request)
    @user = user
    @follow_request = follow_request
  end

  def show?
    user == follow_request.sender || follow_request.recipient
  end


  def edit?
    user == comment.author
  end

  def destroy?
    user == follow_request.sender || follow_request.recipient
  end

  def new?
    create?
  end

   def create?
    !user.nil?
  end

   def update?
    user == follow_request.sender
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
