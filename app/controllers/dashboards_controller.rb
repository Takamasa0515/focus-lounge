class DashboardsController < ApplicationController
  def show
    @current_session = nil
    @recent_sessions = []
  end
end
