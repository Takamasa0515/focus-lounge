class WorkSessionsController < ApplicationController
  def create
    WorkSession.create!(
      user: current_user,
      title: params[:title],
      started_at: Time.zone.parse(params[:started_at]),
      ended_at: Time.current,
      duration_seconds: params[:duration_seconds]
    )
    redirect_to dashboards_show_path
  end
end
