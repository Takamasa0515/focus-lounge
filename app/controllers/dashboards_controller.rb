class DashboardsController < ApplicationController
  before_action :set_user
  def show
    @categories = Category.where(user_id: @user.id)
    @today_work_sessions = @user.work_sessions.today
    @today_total_seconds = @today_work_sessions.sum(:duration_seconds)
  end

  private

  def set_user
    @user = current_user
  end
end
