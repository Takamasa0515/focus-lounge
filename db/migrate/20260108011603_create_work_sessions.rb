class CreateWorkSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :work_sessions do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.datetime :started_at
      t.datetime :ended_at
      t.integer :duration_seconds

      t.timestamps
    end
  end
end
