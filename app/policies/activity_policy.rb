class ActivityPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    return true
  end

  def new?
    return create?
  end

  def create?
    return true
  end

  def edit?
    return update?
  end

  def update?
    user.admin? || record.user == user
    # record: the experience passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def destroy?
    user.admin? || record.user == user
  end

  def toggle_favorite?
    return true
  end
end
