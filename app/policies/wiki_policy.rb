class WikiPolicy < ApplicationPolicy
  class Scope < Scope

    attr_reader :user, :scope

    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.admin?
        scope.all
      else
        scope.where(published: true)
      end
    end


  def update?
    user.admin? or not wiki.published? || record.user == user
  end

  def destroy?
    user.admin? || record.user == user
  end

  def permitted_attributes
    if user.admin? || user.owner_of?(wiki)
      [:title, :body, :tag_list]
    else
      [:tag_list]
    end
  end
  end



  #def new? ; user_is_owner_of_record? ; end
  #def create? ; user_is_owner_of_record? ; end

  #def show
  #user_is_owner_of_record? || @record.published
  #end

  #def update? ; user_is_owner_of_record? ; end
  #def destroy? ; user_is_owner_of_record? ; end



end
