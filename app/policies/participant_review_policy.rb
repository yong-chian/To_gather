class ParticipantReviewPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def show?
    user.admin? || record.booking.user == user
  end

  def new?
    return create?
  end

  def create?
    record.booking.user == user
  end

  def edit?
    return update?
  end

  def update?
    record.booking.user == user
    # record: the review passed to the `authorize` method in controller
    # user: the `current_user` signed in with Devise
  end

  def status?
    record.activity.user == user || user.admin?
  end

  def destroy?
    record.booking.user == user
  end
end
