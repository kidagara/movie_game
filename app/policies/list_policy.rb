class ListPolicy < ApplicationPolicy

  def destroy?
    user && user.has_role?(:admin)
  end
end
