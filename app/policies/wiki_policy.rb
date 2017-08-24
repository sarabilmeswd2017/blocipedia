class WikiPolicy < ApplicationPolicy

  def update?
    user.admin? || record.user == user
  end

  def destroy?
    update?
  end

  def edit?
    update?
  end


  class Scope
   attr_reader :user, :scope

   def initialize(user, scope)
      @user = user
     @scope = scope
   end

  def resolve

    if (user.admin?) || (user.premium?)
      wikis = scope.all
    else
      wikis = Wiki.publicly_visible
    end
    wikis
  end
end


end
