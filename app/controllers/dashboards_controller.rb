class DashboardsController < ApplicationController
  def show
    @categories = Category.all
    @today_total_seconds = current_user.work_sessions.today.sum(:duration_seconds)
  end
end
