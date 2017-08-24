class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
   raise Pundit::NotAuthorizedError, "must be logged in" unless user
   @user   = user
   @record = record
 end

  def index?
    false
  end

  def show?
    scope.where(:id => record.id).exists?
  end

  def create?
    false
  end

  def new?
    create?
  end

  def update?
    user.present?
  end

  def edit?
    update?
  end

  def destroy?
    false
  end

  def scope
    Pundit.policy_scope!(user, record.class)
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
