class AddCategoryIdToWorkSessions < ActiveRecord::Migration[7.1]
  def change
    add_column :work_sessions, :category_id, :integer
  end
end
