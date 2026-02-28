class WorkSessionsController < ApplicationController
  def create
    WorkSession.create!(
      user: current_user,
      title: params[:title],
      category_id: params[:category_id],
      started_at: Time.zone.parse(params[:started_at]),
      ended_at: Time.current,
      duration_seconds: params[:duration_seconds]
    )
    redirect_to dashboards_show_path
  end

  def edit
    @work_session = WorkSession.find(params[:id])
    @categories = Category.where(user_id: current_user.id)
  end

  def update
    @work_session = WorkSession.find(params[:id])
    if @work_session.update(work_session_params)
      redirect_to dashboards_show_path, notice: "更新しました。"
    else
      flash.now[:alert] = "編集に失敗しました"
      render "dashboards/show"
    end
  end

  def destroy
    @work_session = WorkSession.find(params[:id])
    if @work_session.destroy
      redirect_to dashboards_show_path, notice: "作業履歴を削除しました。"
    else
      redirect_to dashboards_show_path, alert: @work_session.errors.full_messages.to_sentence
    end
  end

  private

  def work_session_params
    params.require(:work_session).permit(:title, :category_id)
  end
end
