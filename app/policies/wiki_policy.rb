class WikiPolicy < ApplicationPolicy
  # class Scope < Scope
  #
  #   attr_reader :user, :scope
  #
  #   def initialize(user, scope)
  #     @user  = user
  #     @scope = scope
  #   end
  #
  #   def resolve
  #     if user.admin?
  #       scope.all
  #     else
  #       scope.where(published: true)
  #     end
  #   end


  def update?
    user.admin? || record.user == user
  end

  def destroy?
    update?
  end

  def edit?
    update?
  end

  





end
