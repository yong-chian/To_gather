class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.admin?
        scope.all
      else
        scope.where(user_id: user.id).or(scope.where(activity: { user_id: user.id }))
      end
    end
  end

  def show?
    user.admin? || record.user == user || record.availability.activity.user == user
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
    user.admin? || record.user == user || record.availability.activity.user == user
    # record: the experience passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def host?
    record.availability.activity.user == user || user.admin?
  end

  def destroy?
    user.admin? || record.user == user || record.availability.activity.user == user
  end

  def participant?
    user.admin? || record.user == user
  end
end
