class TodoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def edit?
    @record.user_id = @user
  end
end
