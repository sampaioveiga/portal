class Pneumo::DevicesCategoryPolicy < ApplicationPolicy
  attr_reader :current_user, :model

  def initialize(current_user, model)
    @current_user = current_user
    @devices_category = model
  end

  def index?
    (@current_user.pneumo_user.present? && @current_user.pneumo_user.supervisor?)
  end

  def create?
    (@current_user.pneumo_user.present? && @current_user.pneumo_user.supervisor?)
  end

  def edit?
    (@current_user.pneumo_user.present? && @current_user.pneumo_user.supervisor?)
  end

  def update?
    (@current_user.pneumo_user.present? && @current_user.pneumo_user.supervisor?)
  end

  def destroy?
    (@current_user.pneumo_user.present? && @current_user.pneumo_user.supervisor?)
  end
end