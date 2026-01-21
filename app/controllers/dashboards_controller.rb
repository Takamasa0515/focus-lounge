class DashboardsController < ApplicationController
  def show
    @today_total_seconds = current_user.work_sessions.today.sum(:duration_seconds)
  end
end
