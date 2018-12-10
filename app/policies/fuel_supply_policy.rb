class FuelSupplyPolicy < ApplicationPolicy
  def index?
    @user.has_role?(:employee) || @user.has_role?(:admin)
  end

  def create?
    @user.has_role?(:employee) || @user.has_role?(:admin)
  end

  def new?
    create?
  end

  def show?
    @user.has_role?(:employee) || @user.has_role?(:admin)
  end

  def report?
    create?
  end

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      if user.has_role?(:admin) || user.has_role?(:employee)
        scope.all
      else
        raise Pundit::NotAuthorizedError, 'not allowed to view this action'
      end
    end
  end
end
