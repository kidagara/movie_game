class UserPolicy < ApplicationPolicy

  def show?
    user && (user == record || user.has_role?(:admin))
  end

  def create?
    user && user.has_role?(:admin)
  end

  def update?
    user && (user == record || user.has_role?(:admin))
  end

  def destroy?
    user && user.has_role?(:admin)
  end
end
