class OrderPolicy < ApplicationPolicy
    class Scope < Scope
        # NOTE: Be explicit about which records you allow access to!
        def resolve
            scope.all
        end
    end

    def new?
      return create?
    end

    def create?
      return true
    end

    def show?
      return true
    end
end
