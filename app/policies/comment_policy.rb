class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def index?
    true
  end

  def create?
    user.present? 
  end

  def destroy?
    user.present? && (record.user == user || user.admin? || user.moderator?)
  end
end
