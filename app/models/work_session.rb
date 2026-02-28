class WorkSession < ApplicationRecord
  belongs_to :user
  belongs_to :category

  scope :today, -> { where(created_at: Time.zone.today.all_day) }
end
