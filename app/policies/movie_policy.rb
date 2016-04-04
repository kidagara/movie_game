class MoviePolicy < ApplicationPolicy

  def create?
    user && user.has_role?(:admin)
  end

  def update?
    user && user.has_role?(:admin)
  end

  def destroy?
    user && user.has_role?(:admin)
  end
end
