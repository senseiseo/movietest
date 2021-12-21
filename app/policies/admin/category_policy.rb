module Admin
  class CategoryPolicy < ApplicationPolicy
    def create?
      user.admin_role? || user.moderator_role? 
    end

    def update?
      user.admin_role? || user.moderator_role? 
    end

    def index?
      user.admin_role? || user.moderator_role? 
    end

    def show?
      user.admin_role? || user.moderator_role? 
    end

    def destroy?
      user.admin_role? 
    end 
  end
end