class DashboardsController < ApplicationController
  before_action :set_user
  def show
    @categories = Category.where(user_id: @user.id)
    @today_total_seconds = current_user.work_sessions.today.sum(:duration_seconds)
  end

    private

  def set_user
    @user = current_user
  end
end
